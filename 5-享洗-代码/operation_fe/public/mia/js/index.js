!function(e){function n(o){if(r[o])return r[o].exports;var i=r[o]={exports:{},id:o,loaded:!1};return e[o].call(i.exports,i,i.exports,n),i.loaded=!0,i.exports}var r={};return n.m=e,n.c=r,n.p="",n(0)}([function(e,n,r){e.exports=r(3)},function(e,n){function r(){b=!1,a.length?s=a.concat(s):c=-1,s.length&&o()}function o(){if(!b){var e=setTimeout(r);b=!0;for(var n=s.length;n;){for(a=s,s=[];++c<n;)a&&a[c].run();c=-1,n=s.length}a=null,b=!1,clearTimeout(e)}}function i(e,n){this.fun=e,this.array=n}function t(){}var a,u=e.exports={},s=[],b=!1,c=-1;u.nextTick=function(e){var n=new Array(arguments.length-1);if(arguments.length>1)for(var r=1;r<arguments.length;r++)n[r-1]=arguments[r];s.push(new i(e,n)),1!==s.length||b||setTimeout(o,0)},i.prototype.run=function(){this.fun.apply(null,this.array)},u.title="browser",u.browser=!0,u.env={},u.argv=[],u.version="",u.versions={},u.on=t,u.addListener=t,u.once=t,u.off=t,u.removeListener=t,u.removeAllListeners=t,u.emit=t,u.binding=function(e){throw new Error("process.binding is not supported")},u.cwd=function(){return"/"},u.chdir=function(e){throw new Error("process.chdir is not supported")},u.umask=function(){return 0}},function(e,n){e.exports=function(e){return e.webpackPolyfill||(e.deprecate=function(){},e.paths=[],e.children=[],e.webpackPolyfill=1),e}},function(e,n,r){var o=r(4);e.exports=o},function(e,n,r){function o(e){return Object.prototype.toString.call(e)}function i(e,n){for(var r,o={},i=0,t=arguments.length;t>i;i++){r=arguments[i];for(var a in r)b(r,a)&&(o[a]=r[a])}return o}function t(){return(""+Math.random()).slice(-6)}function a(e){if(void 0===e||"string"!=typeof e)return"";var n=e.length,r=e.indexOf(";jsessionid=");0>r&&(r=n);var o=e.indexOf("/min/?");o>=0&&(o=e.indexOf("?",o)),0>o&&(o=n);var i=e.indexOf("#");0>i&&(i=n);var t=e.indexOf("??");t=e.indexOf("?",0>t?0:t+2),0>t&&(t=n);var a=Math.min(r,o,i,t);return 0>a?e:e.substr(0,a)}function u(e){return String(e).replace(/(?:\r\n|\r|\n)/g,"<CR>")}function s(e){if("[object Object]"!==Object.prototype.toString.call(e))return"";var n=[];for(var r in e)if(b(e,r))if("[object Array]"===o(e[r]))for(var i=0,t=e[r].length;t>i;i++)n.push(r+"="+encodeURIComponent(u(e[r][i])));else n.push(r+"="+encodeURIComponent(u(e[r])));return n.join("&")}function b(e,n){return Object.prototype.hasOwnProperty.call(e,n)}function c(e){d.console&&console.warn&&console.warn(e)}function f(e,n,r){if(r||(r=function(){}),!e)return c("Sai: required logger server."+e),r();if(!n)return r();var o=s(n),i=e+(e.indexOf("?")<0?"?":"&")+o;if(i.length>z)return r();var t=new Image(1,1);t.onload=t.onerror=t.onabort=function(){r(),t.onload=t.onerror=t.onabort=null,t=null},t.src=i}function l(){if(!V){var e=m._DATAS.shift();if(e){V=!0,"jserror"===e.profile&&(e.file=a(e.file));var n=i(S,e);n.rnd=t();var r=x.emit(e.profile,n);return(r=x.emit("*",n)&&r)?void f(m.server,n,function(){V=!1,l()}):(V=!1,l())}}}var d=window,p=d.document,v=d.location,m=d.Sai,h=r(6),w=r(7);m||(m={}),m._DATAS||(m._DATAS=[]),m._EVENTS||(m._EVENTS=[]);var g=m._EVENTS,x=new w;m.on=function(e,n){x.on(e,n)};for(var y=0,O=g.length;O>y;y++)m.on(g[y][0],g[y][1]);var k="2.0",z=h.engine.trident?2083:8190,_=a(v.href),S={url:_,ref:a(p.referrer)||"-",clnt:h.device.name+"/"+h.device.fullVersion+"|"+h.os.name+"/"+h.os.fullVersion+"|"+h.browser.name+"/"+h.browser.fullVersion+"|"+h.engine.name+"/"+h.engine.fullVersion+(h.browser.compatible?"|c":""),v:k},V=!1,j=m._DATAS.push;m._DATAS.push=function(){j.apply(m._DATAS,arguments),l()},l(),d.Sai=m,e.exports=m},,function(e,n,r){(function(e,n){function r(e){return Object.prototype.toString.call(e)}function o(e){return"[object Object]"===r(e)}function i(e){return"[object Function]"===r(e)}function t(e,n){for(var r=0,o=e.length;o>r&&n.call(e,e[r],r)!==!1;r++);}function a(e){if(!p.test(e))return null;var n,r,o,i,t;if(-1!==e.indexOf("trident/")&&(n=/\btrident\/([0-9.]+)/.exec(e),n&&n.length>=2)){o=n[1];var a=n[1].split(".");a[0]=parseInt(a[0],10)+4,t=a.join(".")}n=p.exec(e),i=n[1];var u=n[1].split(".");return"undefined"==typeof t&&(t=i),u[0]=parseInt(u[0],10)-4,r=u.join("."),"undefined"==typeof o&&(o=r),{browserVersion:t,browserMode:i,engineVersion:o,engineMode:r,compatible:o!==r}}function u(e){if(c)try{var n=c.twGetRunPath.toLowerCase(),r=c.twGetSecurityID(d),o=c.twGetVersion(r);if(n&&-1===n.indexOf(e))return!1;if(o)return{version:o}}catch(i){}}function s(e,n,t){var a=i(n)?n.call(null,t):n;if(!a)return null;var u={name:e,version:l,codename:""},s=r(a);if(a===!0)return u;if("[object String]"===s){if(-1!==t.indexOf(a))return u}else{if(o(a))return a.hasOwnProperty("version")&&(u.version=a.version),u;if(a.exec){var b=a.exec(t);if(b)return b.length>=2&&b[1]?u.version=b[1].replace(/_/g,"."):u.version=l,u}}}function b(e,n,r,o){var i=O;t(n,function(n){var r=s(n[0],n[1],e);return r?(i=r,!1):void 0}),r.call(o,i.name,i.version)}var c,f={},l="-1",d=this,p=/\b(?:msie |ie |trident\/[0-9].*rv[ :])([0-9.]+)/,v=/\bbb10\b.+?\bversion\/([\d.]+)/,m=/\bblackberry\b.+\bversion\/([\d.]+)/,h=/\bblackberry\d+\/([\d.]+)/,w=[["nokia",function(e){return-1!==e.indexOf("nokia ")?/\bnokia ([0-9]+)?/:/\bnokia([a-z0-9]+)?/}],["samsung",function(e){return-1!==e.indexOf("samsung")?/\bsamsung(?:[ \-](?:sgh|gt|sm))?-([a-z0-9]+)/:/\b(?:sgh|sch|gt|sm)-([a-z0-9]+)/}],["wp",function(e){return-1!==e.indexOf("windows phone ")||-1!==e.indexOf("xblwp")||-1!==e.indexOf("zunewp")||-1!==e.indexOf("windows ce")}],["pc","windows"],["ipad","ipad"],["ipod","ipod"],["iphone",/\biphone\b|\biph(\d)/],["mac","macintosh"],["mi",/\bmi[ \-]?([a-z0-9 ]+(?= build|\)))/],["hongmi",/\bhm[ \-]?([a-z0-9]+)/],["aliyun",/\baliyunos\b(?:[\-](\d+))?/],["meizu",function(e){return e.indexOf("meizu")>=0?/\bmeizu[\/ ]([a-z0-9]+)\b/:/\bm([0-9cx]{1,4})\b/}],["nexus",/\bnexus ([0-9s.]+)/],["huawei",function(e){var n=/\bmediapad (.+?)(?= build\/huaweimediapad\b)/;return-1!==e.indexOf("huawei-huawei")?/\bhuawei\-huawei\-([a-z0-9\-]+)/:n.test(e)?n:/\bhuawei[ _\-]?([a-z0-9]+)/}],["lenovo",function(e){return-1!==e.indexOf("lenovo-lenovo")?/\blenovo\-lenovo[ \-]([a-z0-9]+)/:/\blenovo[ \-]?([a-z0-9]+)/}],["zte",function(e){return/\bzte\-[tu]/.test(e)?/\bzte-[tu][ _\-]?([a-su-z0-9\+]+)/:/\bzte[ _\-]?([a-su-z0-9\+]+)/}],["vivo",/\bvivo(?: ([a-z0-9]+))?/],["htc",function(e){return/\bhtc[a-z0-9 _\-]+(?= build\b)/.test(e)?/\bhtc[ _\-]?([a-z0-9 ]+(?= build))/:/\bhtc[ _\-]?([a-z0-9 ]+)/}],["oppo",/\boppo[_]([a-z0-9]+)/],["konka",/\bkonka[_\-]([a-z0-9]+)/],["sonyericsson",/\bmt([a-z0-9]+)/],["coolpad",/\bcoolpad[_ ]?([a-z0-9]+)/],["lg",/\blg[\-]([a-z0-9]+)/],["android",/\bandroid\b|\badr\b/],["blackberry",function(e){return e.indexOf("blackberry")>=0?/\bblackberry\s?(\d+)/:"bb10"}]],g=[["wp",function(e){return-1!==e.indexOf("windows phone ")?/\bwindows phone (?:os )?([0-9.]+)/:-1!==e.indexOf("xblwp")?/\bxblwp([0-9.]+)/:-1!==e.indexOf("zunewp")?/\bzunewp([0-9.]+)/:"windows phone"}],["windows",/\bwindows nt ([0-9.]+)/],["macosx",/\bmac os x ([0-9._]+)/],["ios",function(e){return/\bcpu(?: iphone)? os /.test(e)?/\bcpu(?: iphone)? os ([0-9._]+)/:-1!==e.indexOf("iph os ")?/\biph os ([0-9_]+)/:/\bios\b/}],["yunos",/\baliyunos ([0-9.]+)/],["android",function(e){return e.indexOf("android")>=0?/\bandroid[ \/-]?([0-9.x]+)?/:e.indexOf("adr")>=0?e.indexOf("mqqbrowser")>=0?/\badr[ ]\(linux; u; ([0-9.]+)?/:/\badr(?:[ ]([0-9.]+))?/:"android"}],["chromeos",/\bcros i686 ([0-9.]+)/],["linux","linux"],["windowsce",/\bwindows ce(?: ([0-9.]+))?/],["symbian",/\bsymbian(?:os)?\/([0-9.]+)/],["blackberry",function(e){var n=e.match(v)||e.match(m)||e.match(h);return n?{version:n[1]}:"blackberry"}]],x=[["edgehtml",/edge\/([0-9.]+)/],["trident",p],["blink",function(){return"chrome"in d&&"CSS"in d&&/\bapplewebkit[\/]?([0-9.+]+)/}],["webkit",/\bapplewebkit[\/]?([0-9.+]+)/],["gecko",function(e){var n;return(n=e.match(/\brv:([\d\w.]+).*\bgecko\/(\d+)/))?{version:n[1]+"."+n[2]}:void 0}],["presto",/\bpresto\/([0-9.]+)/],["androidwebkit",/\bandroidwebkit\/([0-9.]+)/],["coolpadwebkit",/\bcoolpadwebkit\/([0-9.]+)/],["u2",/\bu2\/([0-9.]+)/],["u3",/\bu3\/([0-9.]+)/]],y=[["edge",/edge\/([0-9.]+)/],["sogou",function(e){return e.indexOf("sogoumobilebrowser")>=0?/sogoumobilebrowser\/([0-9.]+)/:e.indexOf("sogoumse")>=0?!0:/ se ([0-9.x]+)/}],["theworld",function(){var e=u("theworld");return"undefined"!=typeof e?e:"theworld"}],["360",function(e){var n=u("360se");return"undefined"!=typeof n?n:-1!==e.indexOf("360 aphone browser")?/\b360 aphone browser \(([^\)]+)\)/:/\b360(?:se|ee|chrome|browser)\b/}],["maxthon",function(){try{if(c&&(c.mxVersion||c.max_version))return{version:c.mxVersion||c.max_version}}catch(e){}return/\b(?:maxthon|mxbrowser)(?:[ \/]([0-9.]+))?/}],["micromessenger",/\bmicromessenger\/([\d.]+)/],["qq",/\bm?qqbrowser\/([0-9.]+)/],["green","greenbrowser"],["tt",/\btencenttraveler ([0-9.]+)/],["liebao",function(e){if(e.indexOf("liebaofast")>=0)return/\bliebaofast\/([0-9.]+)/;if(-1===e.indexOf("lbbrowser"))return!1;var n;try{c&&c.LiebaoGetVersion&&(n=c.LiebaoGetVersion())}catch(r){}return{version:n||l}}],["tao",/\btaobrowser\/([0-9.]+)/],["coolnovo",/\bcoolnovo\/([0-9.]+)/],["saayaa","saayaa"],["baidu",/\b(?:ba?idubrowser|baiduhd)[ \/]([0-9.x]+)/],["ie",p],["mi",/\bmiuibrowser\/([0-9.]+)/],["opera",function(e){var n=/\bopera.+version\/([0-9.ab]+)/,r=/\bopr\/([0-9.]+)/;return n.test(e)?n:r}],["oupeng",/\boupeng\/([0-9.]+)/],["yandex",/yabrowser\/([0-9.]+)/],["ali-ap",function(e){return e.indexOf("aliapp")>0?/\baliapp\(ap\/([0-9.]+)\)/:/\balipayclient\/([0-9.]+)\b/}],["ali-ap-pd",/\baliapp\(ap-pd\/([0-9.]+)\)/],["ali-am",/\baliapp\(am\/([0-9.]+)\)/],["ali-tb",/\baliapp\(tb\/([0-9.]+)\)/],["ali-tb-pd",/\baliapp\(tb-pd\/([0-9.]+)\)/],["ali-tm",/\baliapp\(tm\/([0-9.]+)\)/],["ali-tm-pd",/\baliapp\(tm-pd\/([0-9.]+)\)/],["uc",function(e){return e.indexOf("ucbrowser/")>=0?/\bucbrowser\/([0-9.]+)/:e.indexOf("ubrowser/")>=0?/\bubrowser\/([0-9.]+)/:/\buc\/[0-9]/.test(e)?/\buc\/([0-9.]+)/:e.indexOf("ucweb")>=0?/\bucweb([0-9.]+)?/:/\b(?:ucbrowser|uc)\b/}],["chrome",/ (?:chrome|crios|crmo)\/([0-9.]+)/],["android",function(e){return-1!==e.indexOf("android")?/\bversion\/([0-9.]+(?: beta)?)/:void 0}],["blackberry",function(e){var n=e.match(v)||e.match(m)||e.match(h);return n?{version:n[1]}:"blackberry"}],["safari",/\bversion\/([0-9.]+(?: beta)?)(?: mobile(?:\/[a-z0-9]+)?)? safari\//],["webview",/\bcpu(?: iphone)? os (?:[0-9._]+).+\bapplewebkit\b/],["firefox",/\bfirefox\/([0-9.ab]+)/],["nokia",/\bnokiabrowser\/([0-9.]+)/]],O={name:"na",version:l},k=function(e){e=(e||"").toLowerCase();var n={};b(e,w,function(e,r){var o=parseFloat(r);n.device={name:e,version:o,fullVersion:r},n.device[e]=o},n),b(e,g,function(e,r){var o=parseFloat(r);n.os={name:e,version:o,fullVersion:r},n.os[e]=o},n);var r=a(e);return b(e,x,function(e,o){var i=o;r&&(o=r.engineVersion||r.engineMode,i=r.engineMode);var t=parseFloat(o);n.engine={name:e,version:t,fullVersion:o,mode:parseFloat(i),fullMode:i,compatible:r?r.compatible:!1},n.engine[e]=t},n),b(e,y,function(e,o){var i=o;r&&("ie"===e&&(o=r.browserVersion),i=r.browserMode);var t=parseFloat(o);n.browser={name:e,version:t,fullVersion:o,mode:parseFloat(i),fullMode:i,compatible:r?r.compatible:!1},n.browser[e]=t},n),n};if("object"==typeof e&&"[object process]"===e.toString()){var z=n.require("./morerule");[].unshift.apply(w,z.DEVICES||[]),[].unshift.apply(g,z.OS||[]),[].unshift.apply(y,z.BROWSER||[]),[].unshift.apply(x,z.ENGINE||[])}else{var _=navigator.userAgent||"",S=navigator.appVersion||"",V=navigator.vendor||"";c=d.external,f=k(_+" "+S+" "+V)}f.parse=k,n.exports=f}).call(n,r(1),r(2)(e))},function(e,n){function r(e){this._={},this.$=e||this}var o=[].slice;r.prototype={on:function(e,n){var r=this,o=r._[e]||(r._[e]=[]);return o.push(n),r},off:function(e,n){var r=this;if(e||n){var o=r._[e];if(o)if(n){for(var i=o.length-1;i>=0;i--)if(o[i]===n){o.splice(i,1);break}}else delete r._[e]}else r._={};return r},emit:function(e){var n=this,r=n._[e],i=o.call(arguments);if(i.shift(),r){r=r.slice();for(var t=0,a=r.length;a>t;t++)r[t].apply(n.$,i)}return n}},e.exports=r}]);