const path = require('path');
const fs = require('fs');
const Smarty = require('smarty4js');
const templates = require('./constants/templates.json');
const hooks = require('./constants/hooks.json');
const shop = require('./datas/shop.json');
const urls = require('./datas/urls.json');

const dir = path.resolve(__dirname, '.');
const templatesPath = path.resolve(__dirname, '../templates');

function ensureDirectoryExistence(filePath) {
  var dirname = path.dirname(filePath);
  if (fs.existsSync(dirname)) {
    return true;
  }
  ensureDirectoryExistence(dirname);
  fs.mkdirSync(dirname);
}

const s = new Smarty({
  left_delimiter: '{', // default
  right_delimiter: '}', // default
  isAmd: false,
  isCmd: false,
  globalVar: '_smartyTpl', // window._smartyTpl is jsTpl object
  hooks
});

function replaceHooks(html) {
  Object.entries(hooks).forEach(([name, paths]) => {
    if(html.replace(name, '') !== html) {
      let datas = {urls, shop};

      if(fs.existsSync(`${dir}/datas/hooks/${name}.json`)) {
        datas = {...datas, ...require(`${dir}/datas/hooks/${name}.json`)}
      }else {
        console.log(`No ./datas/hooks/${name}.json file found.`)
      }

      paths.forEach(path => {
        const compiler = s.compile(`${__dirname}/../${path}`); 

        let hookContent = compiler.render(datas);

        html = html.replace(`((${name}))`, `${hookContent}((${name}))`)
      })

    }
  })
  html = html.replace(/\(\(.*?\)\)/g, '');

  return html;
}

s.register({
  hook: ({h, type, product}) => {
    return `((${h}))`;
  },
  l: function(args) {
    return args.s;
  },
});

s.addPlugin({
  mt_rand: () => {
    return 100;
  },
});


Object.entries(templates).forEach(([name, template]) => {
  s.setBasedir(templatesPath);
  let datas = {shop, urls};
  let file = fs.readFileSync(`${templatesPath}/${template.path}`, 'utf8')

  file = file.replace(/nofilter/g, '');
  file = file.replace(`{include file='_partials/microdata/product-jsonld.tpl'}`, '')
  file = file.replace(`{include file='_partials/microdata/product-list-jsonld.tpl' listing=$listing}`, '')

  Object.entries(template.datas).forEach(([key, data]) => {
    datas = {...datas, [key]: require(`${dir}/datas/${data}`)};
  })

  const compiler = s.compile(file); 

  let html = compiler.render(datas);

  if(template.content && template.content.start) {
    html = template.content.start + html;
  }

  if(template.content && template.content.end) {
    html =  html + template.content.end;
  }

  html = replaceHooks(html);

  ensureDirectoryExistence(`${dir}/build/${template.path}`, html);
  fs.writeFileSync(`${dir}/build/${template.path}`.replace('tpl', 'html'), html)
})
