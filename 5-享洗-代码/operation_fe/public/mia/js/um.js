!function(){var e={},a={};!function(e,r){function t(){var e=s.createElement("canvas"),a=null;try{a=e.getContext("webgl")||e.getContext("experimental-webgl")}catch(r){}return a||(a=null),a}function n(e){function a(a){var n=/([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/,i=n.exec(a);if(i){var o=i[1];t[o]===r&&e(o),t[o]=!0}}var t={},n=!!window.webkitRTCPeerConnection;if(!I){var i=document.createElement("iframe");if(i.style.display="none",i.sandbox="allow-same-origin",!i.addEventListener)return;i.addEventListener("DOMNodeInserted",function(e){e.stopPropagation()},!1),i.addEventListener("DOMNodeInsertedIntoDocument",function(e){e.stopPropagation()},!1),document.body.appendChild(i);var o=i.contentWindow;I=o.RTCPeerConnection||o.mozRTCPeerConnection||o.webkitRTCPeerConnection,n=!!o.webkitRTCPeerConnection}if(I){var s={optional:[{RtpDataChannels:!0}]},l=r;n&&(l={iceServers:[{urls:"stun:stun.services.mozilla.com"}]});var c=new I(l,s);c.onicecandidate=function(e){e.candidate&&a(e.candidate.candidate)},c.createDataChannel(""),c.createOffer(function(e){c.setLocalDescription(e,function(){},function(){})},function(){});var u=0,d=setInterval(function(){var e=c.localDescription.sdp.split("\n");e.forEach(function(e){0===e.indexOf("a=candidate:")&&a(e)}),u++,u>=3&&clearInterval(d)},500)}}var i={};i.encode=function(e){var a=e.replace(/[\u0080-\u07ff]/g,function(e){var a=e.charCodeAt(0);return String.fromCharCode(192|a>>6,128|63&a)});return a=a.replace(/[\u0800-\uffff]/g,function(e){var a=e.charCodeAt(0);return String.fromCharCode(224|a>>12,128|a>>6&63,128|63&a)})},i.ROTL=function(e,a){return e<<a|e>>>32-a},i.toHexStr=function(e){for(var a,r="",t=7;t>=0;t--)a=e>>>4*t&15,r+=a.toString(16);return r},i.f=function(e,a,r,t){switch(e){case 0:return a&r^~a&t;case 1:return a^r^t;case 2:return a&r^a&t^r&t;case 3:return a^r^t}},i.hash=function(e,a){a="undefined"==typeof a?!0:a,a&&(e=i.encode(e));var r=[1518500249,1859775393,2400959708,3395469782];e+=String.fromCharCode(128);var t,n,o,s=e.length/4+2,l=Math.ceil(s/16),c=new Array(l);for(t=0;l>t;t++)for(c[t]=new Array(16),o=0;16>o;o++)c[t][o]=e.charCodeAt(64*t+4*o)<<24|e.charCodeAt(64*t+4*o+1)<<16|e.charCodeAt(64*t+4*o+2)<<8|e.charCodeAt(64*t+4*o+3);c[l-1][14]=8*(e.length-1)/Math.pow(2,32),c[l-1][14]=Math.floor(c[l-1][14]),c[l-1][15]=8*(e.length-1)&4294967295;var u,d,h,g,m,p=1732584193,f=4023233417,T=2562383102,S=271733878,E=3285377520,M=new Array(80);for(t=0;l>t;t++){for(n=0;16>n;n++)M[n]=c[t][n];for(n=16;80>n;n++)M[n]=i.ROTL(M[n-3]^M[n-8]^M[n-14]^M[n-16],1);for(u=p,d=f,h=T,g=S,m=E,n=0;80>n;n++){var v=Math.floor(n/20),A=i.ROTL(u,5)+i.f(v,d,h,g)+m+r[v]+M[n]&4294967295;m=g,g=h,h=i.ROTL(d,30),d=u,u=A}p=p+u&4294967295,f=f+d&4294967295,T=T+h&4294967295,S=S+g&4294967295,E=E+m&4294967295}return i.toHexStr(p)+i.toHexStr(f)+i.toHexStr(T)+i.toHexStr(S)+i.toHexStr(E)};var o=window,s=o.document,l=o.navigator,c="_umdata",u=0,d="",h=function(e){if(0===e.length)return e;var a,r,t=[],n={};for(r=0;r<e.length;r++)a=e[r].charAt(0).toUpperCase(),a>="A"&&"Z">=a||(a="zh"),n[a]=n[a]||[],n[a].push(e[r]);for(r in n)n.hasOwnProperty(r)&&t.push(("zh"===r?"#":r)+i.hash(n[r].join(",")));return t.join(",")},g=function(){return{getExtProps:function(){var e={},a=this.getCanvasData();""!=a&&(e.ecn=i.hash(a)),e.ent=this.getDoNotTrack(),e.eca=p.getBrowCookie("cna"),e.est=u,R.length&&(e.ips=R.join(","));try{e.ms=localStorage.getItem("_umid_cost")}catch(r){}if(e.type="pc",!f.isIE()){var t=this.getPlugins();if(e.epl=t.length,0!=e.epl&&(e.ep=i.hash(t.join(",")),e.epls=h(t)),v)e.fonts=M.getFontsMd5(),e.efts=M.getFontsByGroupMd5().join(","),e.efty=0,e.efcn=M.getFontCount();else{var n=this.getFontsByJS();e.efcn=n.length,e.fonts=i.hash(n.join(",")),e.efts=h(n),e.efty=1}}return o.MediaStreamTrack&&(e.erd=d),/iPhone|iPad|iPod/i.test(navigator.userAgent)||(e.ewgl=this.getWebglFp()),f.toJson(e)},getWebRTCID:function(){var e=[];o.MediaStreamTrack&&MediaStreamTrack.getSources&&MediaStreamTrack.getSources(function(a){for(var r=0,t=a.length;t>r;r++){var n=a[r];try{e.push(n.id)}catch(i){}}d=e.join(",")})},getWebglFp:function(){var e={canvas:function(){var e=s.createElement("canvas");return e.getContext&&e.getContext("2d")}()};if(e.webgl=function(){if(!e.canvas)return!1;var a,r=s.createElement("canvas");try{a=r.getContext&&(r.getContext("webgl")||r.getContext("experimental-webgl"))}catch(t){a=!1}return!!o.WebGLRenderingContext&&!!a}(),!e.webgl)return"";var a,r,n=function(e){return r.clearColor(0,0,0,1),r.enable(r.DEPTH_TEST),r.depthFunc(r.LEQUAL),r.clear(r.COLOR_BUFFER_BIT|r.DEPTH_BUFFER_BIT),"["+e[0]+", "+e[1]+"]"},l=function(e){var a,r=e.getExtension("EXT_texture_filter_anisotropic")||e.getExtension("WEBKIT_EXT_texture_filter_anisotropic")||e.getExtension("MOZ_EXT_texture_filter_anisotropic");return r?(a=e.getParameter(r.MAX_TEXTURE_MAX_ANISOTROPY_EXT),0===a&&(a=2),a):null};if(r=t(),!r)return null;var c=[],u="attribute vec2 attrVertex;varying vec2 varyinTexCoordinate;uniform vec2 uniformOffset;void main(){varyinTexCoordinate=attrVertex+uniformOffset;gl_Position=vec4(attrVertex,0,1);}",d="precision mediump float;varying vec2 varyinTexCoordinate;void main() {gl_FragColor=vec4(varyinTexCoordinate,0,1);}",h=r.createBuffer();r.bindBuffer(r.ARRAY_BUFFER,h);var g=new Float32Array([-.2,-.9,0,.4,-.26,0,0,.732134444,0]);r.bufferData(r.ARRAY_BUFFER,g,r.STATIC_DRAW),h.itemSize=3,h.numItems=3;var m=r.createProgram(),p=r.createShader(r.VERTEX_SHADER);r.shaderSource(p,u),r.compileShader(p);var f=r.createShader(r.FRAGMENT_SHADER);return r.shaderSource(f,d),r.compileShader(f),r.attachShader(m,p),r.attachShader(m,f),r.linkProgram(m),r.useProgram(m),m.vertexPosAttrib=r.getAttribLocation(m,"attrVertex"),m.offsetUniform=r.getUniformLocation(m,"uniformOffset"),r.enableVertexAttribArray(m.vertexPosArray),r.vertexAttribPointer(m.vertexPosAttrib,h.itemSize,r.FLOAT,!1,0,0),r.uniform2f(m.offsetUniform,1,1),r.drawArrays(r.TRIANGLE_STRIP,0,h.numItems),null!=r.canvas&&c.push(r.canvas.toDataURL()),c.push("extensions:"+r.getSupportedExtensions().join(";")),c.push("webgl aliased line width range:"+n(r.getParameter(r.ALIASED_LINE_WIDTH_RANGE))),c.push("webgl aliased point size range:"+n(r.getParameter(r.ALIASED_POINT_SIZE_RANGE))),c.push("webgl alpha bits:"+r.getParameter(r.ALPHA_BITS)),c.push("webgl antialiasing:"+(r.getContextAttributes().antialias?"yes":"no")),c.push("webgl blue bits:"+r.getParameter(r.BLUE_BITS)),c.push("webgl depth bits:"+r.getParameter(r.DEPTH_BITS)),c.push("webgl green bits:"+r.getParameter(r.GREEN_BITS)),c.push("webgl max anisotropy:"+l(r)),c.push("webgl max combined texture image units:"+r.getParameter(r.MAX_COMBINED_TEXTURE_IMAGE_UNITS)),c.push("webgl max cube map texture size:"+r.getParameter(r.MAX_CUBE_MAP_TEXTURE_SIZE)),c.push("webgl max fragment uniform vectors:"+r.getParameter(r.MAX_FRAGMENT_UNIFORM_VECTORS)),c.push("webgl max render buffer size:"+r.getParameter(r.MAX_RENDERBUFFER_SIZE)),c.push("webgl max texture image units:"+r.getParameter(r.MAX_TEXTURE_IMAGE_UNITS)),c.push("webgl max texture size:"+r.getParameter(r.MAX_TEXTURE_SIZE)),c.push("webgl max varying vectors:"+r.getParameter(r.MAX_VARYING_VECTORS)),c.push("webgl max vertex attribs:"+r.getParameter(r.MAX_VERTEX_ATTRIBS)),c.push("webgl max vertex texture image units:"+r.getParameter(r.MAX_VERTEX_TEXTURE_IMAGE_UNITS)),c.push("webgl max vertex uniform vectors:"+r.getParameter(r.MAX_VERTEX_UNIFORM_VECTORS)),c.push("webgl max viewport dims:"+n(r.getParameter(r.MAX_VIEWPORT_DIMS))),c.push("webgl red bits:"+r.getParameter(r.RED_BITS)),c.push("webgl renderer:"+r.getParameter(r.RENDERER)),c.push("webgl shading language version:"+r.getParameter(r.SHADING_LANGUAGE_VERSION)),c.push("webgl stencil bits:"+r.getParameter(r.STENCIL_BITS)),c.push("webgl vendor:"+r.getParameter(r.VENDOR)),c.push("webgl version:"+r.getParameter(r.VERSION)),r.getShaderPrecisionFormat?(c.push("webgl vertex shader high float precision:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.HIGH_FLOAT).precision),c.push("webgl vertex shader high float precision rangeMin:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.HIGH_FLOAT).rangeMin),c.push("webgl vertex shader high float precision rangeMax:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.HIGH_FLOAT).rangeMax),c.push("webgl vertex shader medium float precision:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.MEDIUM_FLOAT).precision),c.push("webgl vertex shader medium float precision rangeMin:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.MEDIUM_FLOAT).rangeMin),c.push("webgl vertex shader medium float precision rangeMax:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.MEDIUM_FLOAT).rangeMax),c.push("webgl vertex shader low float precision:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.LOW_FLOAT).precision),c.push("webgl vertex shader low float precision rangeMin:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.LOW_FLOAT).rangeMin),c.push("webgl vertex shader low float precision rangeMax:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.LOW_FLOAT).rangeMax),c.push("webgl fragment shader high float precision:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.HIGH_FLOAT).precision),c.push("webgl fragment shader high float precision rangeMin:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.HIGH_FLOAT).rangeMin),c.push("webgl fragment shader high float precision rangeMax:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.HIGH_FLOAT).rangeMax),c.push("webgl fragment shader medium float precision:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.MEDIUM_FLOAT).precision),c.push("webgl fragment shader medium float precision rangeMin:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.MEDIUM_FLOAT).rangeMin),c.push("webgl fragment shader medium float precision rangeMax:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.MEDIUM_FLOAT).rangeMax),c.push("webgl fragment shader low float precision:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.LOW_FLOAT).precision),c.push("webgl fragment shader low float precision rangeMin:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.LOW_FLOAT).rangeMin),c.push("webgl fragment shader low float precision rangeMax:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.LOW_FLOAT).rangeMax),c.push("webgl vertex shader high int precision:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.HIGH_INT).precision),c.push("webgl vertex shader high int precision rangeMin:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.HIGH_INT).rangeMin),c.push("webgl vertex shader high int precision rangeMax:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.HIGH_INT).rangeMax),c.push("webgl vertex shader medium int precision:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.MEDIUM_INT).precision),c.push("webgl vertex shader medium int precision rangeMin:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.MEDIUM_INT).rangeMin),c.push("webgl vertex shader medium int precision rangeMax:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.MEDIUM_INT).rangeMax),c.push("webgl vertex shader low int precision:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.LOW_INT).precision),c.push("webgl vertex shader low int precision rangeMin:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.LOW_INT).rangeMin),c.push("webgl vertex shader low int precision rangeMax:"+r.getShaderPrecisionFormat(r.VERTEX_SHADER,r.LOW_INT).rangeMax),c.push("webgl fragment shader high int precision:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.HIGH_INT).precision),c.push("webgl fragment shader high int precision rangeMin:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.HIGH_INT).rangeMin),c.push("webgl fragment shader high int precision rangeMax:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.HIGH_INT).rangeMax),c.push("webgl fragment shader medium int precision:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.MEDIUM_INT).precision),c.push("webgl fragment shader medium int precision rangeMin:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.MEDIUM_INT).rangeMin),c.push("webgl fragment shader medium int precision rangeMax:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.MEDIUM_INT).rangeMax),c.push("webgl fragment shader low int precision:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.LOW_INT).precision),c.push("webgl fragment shader low int precision rangeMin:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.LOW_INT).rangeMin),c.push("webgl fragment shader low int precision rangeMax:"+r.getShaderPrecisionFormat(r.FRAGMENT_SHADER,r.LOW_INT).rangeMax),a=c.join("~"),i.hash(a)):c.join("~")},getFontsByJS:function(){var e=["monospace","sans-serif","serif"],a="mmmmmmmmmmlli",r="72px",t=s.getElementsByTagName("body")[0],n=document.createElement("span");n.style.fontSize=r,n.innerHTML=a;var i={},o={};for(var l in e)n.style.fontFamily=e[l],t.appendChild(n),i[e[l]]=n.offsetWidth,o[e[l]]=n.offsetHeight,t.removeChild(n);var c=function(a){var r=!1;for(var s in e){n.style.fontFamily=a+","+e[s],t.appendChild(n);var l=n.offsetWidth!==i[e[s]]||n.offsetHeight!==o[e[s]];t.removeChild(n),r=r||l}return r},u=["Andale Mono","Arial","Arial Black","Arial Hebrew","Arial MT","Arial Narrow","Arial Rounded MT Bold","Arial Unicode MS","Bitstream Vera Sans Mono","Book Antiqua","Bookman Old Style","Calibri","Cambria","Cambria Math","Century","Century Gothic","Century Schoolbook","Comic Sans","Comic Sans MS","Consolas","Courier","Courier New","Garamond","Geneva","Georgia","Helvetica","Helvetica Neue","Impact","Lucida Bright","Lucida Calligraphy","Lucida Console","Lucida Fax","LUCIDA GRANDE","Lucida Handwriting","Lucida Sans","Lucida Sans Typewriter","Lucida Sans Unicode","Microsoft Sans Serif","Monaco","Monotype Corsiva","MS Gothic","MS Outlook","MS PGothic","MS Reference Sans Serif","MS Sans Serif","MS Serif","MYRIAD","MYRIAD PRO","Palatino","Palatino Linotype","Segoe Print","Segoe Script","Segoe UI","Segoe UI Light","Segoe UI Semibold","Segoe UI Symbol","Tahoma","Times","Times New Roman","Times New Roman PS","Trebuchet MS","Verdana","Wingdings","Wingdings 2","Wingdings 3"],d=["Abadi MT Condensed Light","Academy Engraved LET","ADOBE CASLON PRO","Adobe Garamond","ADOBE GARAMOND PRO","Agency FB","Aharoni","Albertus Extra Bold","Albertus Medium","Algerian","Amazone BT","American Typewriter","American Typewriter Condensed","AmerType Md BT","Andalus","Angsana New","AngsanaUPC","Antique Olive","Aparajita","Apple Chancery","Apple Color Emoji","Apple SD Gothic Neo","Arabic Typesetting","ARCHER","ARNO PRO","Arrus BT","Aurora Cn BT","AvantGarde Bk BT","AvantGarde Md BT","AVENIR","Ayuthaya","Bandy","Bangla Sangam MN","Bank Gothic","BankGothic Md BT","Baskerville","Baskerville Old Face","Batang","BatangChe","Bauer Bodoni","Bauhaus 93","Bazooka","Bell MT","Bembo","Benguiat Bk BT","Berlin Sans FB","Berlin Sans FB Demi","Bernard MT Condensed","BernhardFashion BT","BernhardMod BT","Big Caslon","BinnerD","Blackadder ITC","BlairMdITC TT","Bodoni 72","Bodoni 72 Oldstyle","Bodoni 72 Smallcaps","Bodoni MT","Bodoni MT Black","Bodoni MT Condensed","Bodoni MT Poster Compressed","Bookshelf Symbol 7","Boulder","Bradley Hand","Bradley Hand ITC","Bremen Bd BT","Britannic Bold","Broadway","Browallia New","BrowalliaUPC","Brush Script MT","Californian FB","Calisto MT","Calligrapher","Candara","CaslonOpnface BT","Castellar","Centaur","Cezanne","CG Omega","CG Times","Chalkboard","Chalkboard SE","Chalkduster","Charlesworth","Charter Bd BT","Charter BT","Chaucer","ChelthmITC Bk BT","Chiller","Clarendon","Clarendon Condensed","CloisterBlack BT","Cochin","Colonna MT","Constantia","Cooper Black","Copperplate","Copperplate Gothic","Copperplate Gothic Bold","Copperplate Gothic Light","CopperplGoth Bd BT","Corbel","Cordia New","CordiaUPC","Cornerstone","Coronet","Cuckoo","Curlz MT","DaunPenh","Dauphin","David","DB LCD Temp","DELICIOUS","Denmark","DFKai-SB","Didot","DilleniaUPC","DIN","DokChampa","Dotum","DotumChe","Ebrima","Edwardian Script ITC","Elephant","English 111 Vivace BT","Engravers MT","EngraversGothic BT","Eras Bold ITC","Eras Demi ITC","Eras Light ITC","Eras Medium ITC","EucrosiaUPC","Euphemia","Euphemia UCAS","EUROSTILE","Exotc350 Bd BT","FangSong","Felix Titling","Fixedsys","FONTIN","Footlight MT Light","Forte","FrankRuehl","Fransiscan","Freefrm721 Blk BT","FreesiaUPC","Freestyle Script","French Script MT","FrnkGothITC Bk BT","Fruitger","FRUTIGER","Futura","Futura Bk BT","Futura Lt BT","Futura Md BT","Futura ZBlk BT","FuturaBlack BT","Gabriola","Galliard BT","Gautami","Geeza Pro","Geometr231 BT","Geometr231 Hv BT","Geometr231 Lt BT","GeoSlab 703 Lt BT","GeoSlab 703 XBd BT","Gigi","Gill Sans","Gill Sans MT","Gill Sans MT Condensed","Gill Sans MT Ext Condensed Bold","Gill Sans Ultra Bold","Gill Sans Ultra Bold Condensed","Gisha","Gloucester MT Extra Condensed","GOTHAM","GOTHAM BOLD","Goudy Old Style","Goudy Stout","GoudyHandtooled BT","GoudyOLSt BT","Gujarati Sangam MN","Gulim","GulimChe","Gungsuh","GungsuhChe","Gurmukhi MN","Haettenschweiler","Harlow Solid Italic","Harrington","Heather","Heiti SC","Heiti TC","HELV","Herald","High Tower Text","Hiragino Kaku Gothic ProN","Hiragino Mincho ProN","Hoefler Text","Humanst 521 Cn BT","Humanst521 BT","Humanst521 Lt BT","Imprint MT Shadow","Incised901 Bd BT","Incised901 BT","Incised901 Lt BT","INCONSOLATA","Informal Roman","Informal011 BT","INTERSTATE","IrisUPC","Iskoola Pota","JasmineUPC","Jazz LET","Jenson","Jester","Jokerman","Juice ITC","Kabel Bk BT","Kabel Ult BT","Kailasa","KaiTi","Kalinga","Kannada Sangam MN","Kartika","Kaufmann Bd BT","Kaufmann BT","Khmer UI","KodchiangUPC","Kokila","Korinna BT","Kristen ITC","Krungthep","Kunstler Script","Lao UI","Latha","Leelawadee","Letter Gothic","Levenim MT","LilyUPC","Lithograph","Lithograph Light","Long Island","Lydian BT","Magneto","Maiandra GD","Malayalam Sangam MN","Malgun Gothic","Mangal","Marigold","Marion","Marker Felt","Market","Marlett","Matisse ITC","Matura MT Script Capitals","Meiryo","Meiryo UI","Microsoft Himalaya","Microsoft JhengHei","Microsoft New Tai Lue","Microsoft PhagsPa","Microsoft Tai Le","Microsoft Uighur","Microsoft YaHei","Microsoft Yi Baiti","MingLiU","MingLiU_HKSCS","MingLiU_HKSCS-ExtB","MingLiU-ExtB","Minion","Minion Pro","Miriam","Miriam Fixed","Mistral","Modern","Modern No. 20","Mona Lisa Solid ITC TT","Mongolian Baiti","MONO","MoolBoran","Mrs Eaves","MS LineDraw","MS Mincho","MS PMincho","MS Reference Specialty","MS UI Gothic","MT Extra","MUSEO","MV Boli","Nadeem","Narkisim","NEVIS","News Gothic","News GothicMT","NewsGoth BT","Niagara Engraved","Niagara Solid","Noteworthy","NSimSun","Nyala","OCR A Extended","Old Century","Old English Text MT","Onyx","Onyx BT","OPTIMA","Oriya Sangam MN","OSAKA","OzHandicraft BT","Palace Script MT","Papyrus","Parchment","Party LET","Pegasus","Perpetua","Perpetua Titling MT","PetitaBold","Pickwick","Plantagenet Cherokee","Playbill","PMingLiU","PMingLiU-ExtB","Poor Richard","Poster","PosterBodoni BT","PRINCETOWN LET","Pristina","PTBarnum BT","Pythagoras","Raavi","Rage Italic","Ravie","Ribbon131 Bd BT","Rockwell","Rockwell Condensed","Rockwell Extra Bold","Rod","Roman","Sakkal Majalla","Santa Fe LET","Savoye LET","Sceptre","Script","Script MT Bold","SCRIPTINA","Serifa","Serifa BT","Serifa Th BT","ShelleyVolante BT","Sherwood","Shonar Bangla","Showcard Gothic","Shruti","Signboard","SILKSCREEN","SimHei","Simplified Arabic","Simplified Arabic Fixed","SimSun","SimSun-ExtB","Sinhala Sangam MN","Sketch Rockwell","Skia","Small Fonts","Snap ITC","Snell Roundhand","Socket","Souvenir Lt BT","Staccato222 BT","Steamer","Stencil","Storybook","Styllo","Subway","Swis721 BlkEx BT","Swiss911 XCm BT","Sylfaen","Synchro LET","System","Tamil Sangam MN","Technical","Teletype","Telugu Sangam MN","Tempus Sans ITC","Terminal","Thonburi","Traditional Arabic","Trajan","TRAJAN PRO","Tristan","Tubular","Tunga","Tw Cen MT","Tw Cen MT Condensed","Tw Cen MT Condensed Extra Bold","TypoUpright BT","Unicorn","Univers","Univers CE 55 Medium","Univers Condensed","Utsaah","Vagabond","Vani","Vijaya","Viner Hand ITC","VisualUI","Vivaldi","Vladimir Script","Vrinda","Westminster","WHITNEY","Wide Latin","ZapfEllipt BT","ZapfHumnst BT","ZapfHumnst Dm BT","Zapfino","Zurich BlkEx BT","Zurich Ex BT","ZWAdobeF"];u=u.concat(d);for(var h=[],g=0,m=u.length;m>g;g++)c(u[g])&&h.push(u[g]);return h},getPlugins:function(){if(f.isIE()&&f.isIE()<11)return this.getPluginsIE();for(var e=l.plugins||[],a=[],r=0;r<e.length;r++){var t=e[r];try{if(t){for(var n=[],i=0;i<t.length;i++)t.item(i)&&n.push(t.item(i).type);var o=t.name+";";t.version&&(o+=t.version+";"),o+=t.filename+";",o+=n.join(";"),a.push(o)}}catch(s){}}return a},getPluginsIE:function(){for(var e=[],a=function(a){if(window&&a&&window.ActiveXObject){for(var r=0,t=null;null===t&&r<a.ids.length;){try{t=new ActiveXObject(a.ids[r])}catch(n){}r++}if(t)try{e.push(a.name+"=="+a.getVersion(t,a.ids[r]))}catch(n){}}},r=[{name:"Quicktime",ids:["QuickTimeCheckObject.QuickTimeCheck.1","QuickTime.QuickTime"],getVersion:function(e,a){return e.QuickTimeVersion.toString(16).replace(/^(.)(.)(.).*/,"$1.$2.$3")}},{name:"Acrobat",ids:["PDF.PdfCtrl.7","PDF.PdfCtrl.6","PDF.PdfCtrl.5","PDF.PdfCtrl.4","PDF.PdfCtrl.3","AcroPDF.PDF.1"],getVersion:function(e,a){return a.replace(/^[a-zA-Z.]+\.([0-9][0-9.]*)/,"$1")}},{name:"RealPlayer",ids:["RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)","RealVideo.RealVideo(tm) ActiveX Control (32-bit)","rmocx.RealPlayer G2 Control"],getVersion:function(e,a){return e.GetVersionInfo()}},{name:"Flash",ids:["ShockwaveFlash.ShockwaveFlash.9","ShockwaveFlash.ShockwaveFlash.8.5","ShockwaveFlash.ShockwaveFlash.8","ShockwaveFlash.ShockwaveFlash.7","ShockwaveFlash.ShockwaveFlash.6","ShockwaveFlash.ShockwaveFlash.5","ShockwaveFlash.ShockwaveFlash.4"],getVersion:function(e,a){return e.GetVariable("$version").replace(/[a-zA-Z ]*([0-9,]+)/,"$1").replace(/,/g,".")}},{name:"Adobe SVG",ids:["Adobe.SVGCtl"],getVersion:function(e,a){return e.getSVGViewerVersion().replace(/[a-zA-Z; ]*([0-9.]+)/,"$1")}},{name:"Windows Media Player",ids:["WMPlayer.OCX","MediaPlayer.MediaPlayer.1"],getVersion:function(e,a){return e.versionInfo}},{name:"DivX",ids:["npdivx.DivXBrowserPlugin.1","npdivx.DivXBrowserPlugin"],getVersion:function(e,a){return e.GetVersion()}},{name:"WPFe (Silverlight)",ids:["AgControl.AgControl"],getVersion:function(e,a){for(var r="1",t="0",n="0";e.IsVersionSupported(r+"."+t+"."+n);)r++;for(r--;e.IsVersionSupported(r+"."+t+"."+n);)t++;for(t--;e.IsVersionSupported(r+"."+t+"."+n);)n++;return n--,r+"."+t+"."+n}},{name:"MSXML",ids:["MSXML2.DOMDocument.6.0","MSXML2.DOMDocument.5.0","MSXML2.DOMDocument.4.0","MSXML2.DOMDocument.3.0"],getVersion:function(e,a){return a.replace(/^[a-zA-Z.2]+\.([0-9]+\.[0-9.]+)/,"$1")}}],t=0;t<r.length;t++)a(r[t]);return e},getCanvasData:function(){try{var e=s.createElement("canvas");e.height=60,e.width=400;var a=e.getContext("2d");return e.style.display="inline",a.textBaseline="alphabetic",a.fillStyle="#f60",a.fillRect(125,1,62,20),a.fillStyle="#069",a.font="11pt no-real-font-123",a.fillText("Cwm fjordbank glyphs vext quiz, 😃",2,15),a.fillStyle="rgba(102, 204, 0, 0.7)",a.font="18pt Arial",a.fillText("Cwm fjordbank glyphs vext quiz, 😃",4,45),e.toDataURL()}catch(r){return""}},getDoNotTrack:function(){var e="";return e=null!=l.doNotTrack&&"unspecified"!=l.doNotTrack?"1"==l.doNotTrack||"yes"==l.doNotTrack?"yes":"no":"NC"}}}();g.getWebRTCID();var m,p=function(){var e,a=null,t=!1;return{init:function(a,r){e=a,t=r},setUserData:function(e){a=e},set:function(r,t){try{e&&e.setCookie(r,t)}catch(n){}try{window.localStorage&&(localStorage[r]=t)}catch(n){}if(l.cookieEnabled){var i=31536e6,o=r+"="+encodeURIComponent(t);o+=";expires="+new Date((new Date).getTime()+i).toGMTString(),s.cookie=o}if(f.isIE()&&f.isIE()<11&&a)try{a.load("um"),a.setAttribute(r,t),a.save("um")}catch(n){}},get:function(r,n){var i;if(t&&e)try{if(i=e.getCookie(r)||"")return u=1,n||this.set(r,i),i}catch(o){}try{if(window.localStorage&&(i=localStorage[r]||""))return u=2,n||this.set(r,i),i}catch(o){}if(f.isIE()&&f.isIE()<11&&a)try{if(a.load("um"),i=a.getAttribute(r))return u=8,n||this.set(r,i),i}catch(o){}return l.cookieEnabled&&(i=this.getBrowCookie(r))?(u=16,n||this.set(r,i),i):void 0},getBrowCookie:function(e){for(var a,r=document.cookie?document.cookie.split("; "):[],t=0,n=r.length;n>t;t++){var i=r[t].split("="),o=decodeURIComponent(i.shift());if(e===o){a=i.shift();break}}return a},remove:function(n,i){if(i==r&&(i=255),l.cookieEnabled&&16&i&&(s.cookie=n+"=;expires=Thu, 01-Jan-70 00:00:01 GMT;"),f.isIE()&&f.isIE()<11&&a)try{a.load("um"),a.removeAttribute(n),a.save("um")}catch(o){}try{4&i&&window.localStorage&&localStorage.removeItem(n),1&i&&t&&e.setCookie(n,"")}catch(o){}},renderUserData:function(){var e='<input type="hidden" id="umData" style="behavior:url("#default#userData")"/>';f.append(s.body,e)}}}(),f=function(){var e,a=function(){var e=l.userAgent,a=e.indexOf("MSIE ");if(a>0)return parseInt(e.substring(a+5,e.indexOf(".",a)),10);var r=e.indexOf("Trident/");if(r>0){var t=e.indexOf("rv:");return parseInt(e.substring(t+3,e.indexOf(".",t)),10)}var n=e.indexOf("Edge/");return n>0?parseInt(e.substring(n+5,e.indexOf(".",n)),10):!1}();return{init:function(a){e=a},isIE:function(){return a},jsonp:function(){var e=s.getElementsByTagName("head")[0]||s.documentElement,a=function(a){var r="_"+parseInt(1e4*Math.random(),10)+"_"+(new Date).getTime();return window[r]=function(t){a(t),e.removeChild(s.getElementById(r));try{delete window[r]}catch(n){}},r};return function(r,t,n){var i,o=!1,l=s.createElement("script"),c=a(t),u=r;i=[];for(var d in n||{})i.push(d+"="+encodeURIComponent(n[d]));i.push("_callback="+c),u+=u.indexOf("?")>0?"&":"?",u+=i.join("&"),l.id=c,l.onload=l.onreadystatechange=function(){o||this.readyState&&"loaded"!==this.readyState&&"complete"!==this.readyState||(o=!0,l.onload=l.onreadystatechange=null)},l.src=u,e.insertBefore(l,e.firstChild)}}(),extend:function(e){for(var a=1,r=arguments.length;r>a;a++)for(var t in arguments[a])arguments[a].hasOwnProperty(t)&&(e[t]=arguments[a][t]);return e},detectPlugin:function(e,a){return l.plugins&&l.plugins[e]&&l.mimeTypes&&l.mimeTypes[a]&&l.mimeTypes[a].enabledPlugin?l.plugins[e]:!1},detectActiveX:function(e){var a=!1;try{a=new ActiveXObject(e)}catch(r){}return a},toJson:function(e){var a=[];try{for(var r in e){var t="",n=e[r];switch(typeof n){case"string":n=n.replace(/\"/g,"."),t=r+':"'+n+'"',a.push(t);break;case"number":t=r+":"+n,a.push(t);break;case"boolean":t=n?r+":1":r+":0",a.push(t)}}}catch(r){}return"{"+a.join(",")+"}"},append:function(e,a){e||(e=s.body);var r=s.createElement("span");r.innerHTML=a,e.insertBefore(r.firstChild,e.firstChild),r=null},track:function(){var a=[];return function(r){e.debug&&(window.Tracker?Tracker.click("um-"+r):r&&(a.push(r),setTimeout(function(){f.track(a.shift())},100)))}}()}}(),T={version:"3.0.10",enabled:!0,debug:!1,ratio:1,timeout:3e3,timestamp:"-",token:"",serviceLocation:"cn",serviceUrl:"/service/um.json",flashUrl:"https://g.alicdn.com/security/umflash/fp.swf",enableMod:!0,containers:{flash:null,dcp:null},appName:""},S={cn:"https://ynuf.alipay.com/service/um.json",us:"https://us.ynuf.alipay.com/service/um.json",daily:"https://umidstable.alibaba-inc.com/service/um.json"},E=0,M=null,v=!1,A=null,C=!1,w=null,b={},B=function(){M=s.getElementById("umFlash"),A=s.getElementById("umDcp");try{A&&"undefined"!=typeof A.getHardVersion&&(w.mod=parseInt(A.getHardVersion().replace(/\./g,""),10)||1)}catch(e){}try{v||(v=M&&M.md5),p.init(M,v)}catch(e){}},I=window.RTCPeerConnection||window.mozRTCPeerConnection||window.webkitRTCPeerConnection,R=[],y=function(){var e,a=[0,0,0],r=0;if(f.isIE()){if(e=f.detectActiveX("ShockwaveFlash.ShockwaveFlash"))try{(n=e.GetVariable("$version"))&&(n=n.split(" ")[1].split(","),a=[parseInt(n[0],10),parseInt(n[1],10),parseInt(n[2],10)])}catch(t){}if(e=b.enableMod&&f.detectActiveX("Alim.webmod")){try{r=1,"undefined"!=typeof e.getHardVersion&&(r=parseInt(e.getHardVersion().replace(/\./g,""),10)||1)}catch(t){}e=null}}else{if(e=f.detectPlugin("Shockwave Flash","application/x-shockwave-flash"),e&&e.description){var n=e.description.replace(/^.*\s+(\S+\s+\S+$)/,"$1");a[0]=parseInt(n.replace(/^(.*)\..*$/,"$1"),10),a[1]=parseInt(n.replace(/^.*\.(.*)\s.*$/,"$1"),10),a[2]=/[a-zA-Z]/.test(n)?parseInt(n.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0}e=b.enableMod&&f.detectPlugin("Alipay webmod control","application/alidcp"),e&&(r=1,e=null)}return{flash:a,mod:r}};e.getStatus=function(e){return e?E:E>=200},e.getData=function(){return a};var P,x;e.init=function(a){if(!C){P=new Date,C=!0;try{b=f.extend({},T,a||{}),a.serviceLocation&&(b.serviceUrl=S[a.serviceLocation]||b.serviceUrl),f.init(b)}catch(r){}w=y(),E=1;var t=0;if(m=setTimeout(function(){if(3>E){if(B(),t++,10>t&&M)return f.track(v?"timeout-flash":"timeout-flash-na"),setTimeout(arguments.callee,b.timeout>>1),void F();setTimeout(arguments.callee,200)}E=201},b.timeout),b.debug&&(e.options=b),b.enabled&&(b.ratio<=1||!parseInt(Math.random()*b.ratio,10)))try{_()}catch(r){f.track("init-error")}n(function(e){e&&R.push(e)})}};var F=function(){var r=function(e,a){if("boolean"!=typeof e&&(!e||"-"==e))return"-";var r;switch(a){case 0:"string"==typeof e&&(e="true"===e),r=e?"1":"0";break;case 1:r=parseInt(e,10)||0;break;case 2:e=""+e,r=v&&e.length>32?M.md5(e):e;break;case 3:r=""+e;break;default:r="-"}return r},t=[{avHardwareDisable:[0,0],hasAudio:[0,0],hasAudioEncoder:[0,0],hasMP3:[0,0],hasPrinting:[0,0],hasStreamingAudio:[0,0],hasStreamingVideo:[0,0],hasVideoEncoder:[0,0],maxLevelIDC:[1,0],pixelAspectRatio:[1,0],screenColor:[2,0],screenDPI:[1,1],screenResolutionX:[1,0],screenResolutionY:[1,0]},{hasAccessibility:[0,0],hasEmbeddedVideo:[0,0],hasScreenBroadcast:[0,0],hasScreenPlayback:[0,0],isDebugger:[0,0],isEmbeddedInAcrobat:[0,0],hasIME:[0,0],hasTLS:[0,0],language:[2,0],languages:[2,0],localFileReadDisable:[0,0],os:[2,0],cookieEnabled:[0,1],platform:[2,1,function(e){return e?e.split(" ").shift():""}]},{playerType:[2,0],version:[2,0],userAgent:[2,1],appCodeName:[2,1],appMinorVersion:[2,1],appName:[2,1],appVersion:[2,1],systemLanguage:[2,1],userLanguage:[2,1],browserLanguage:[2,1],manufacturer:[2,0],fonts:[2,0],cpuClass:[2,1]},{width:[1,2],height:[1,2],availWidth:[1,2],availHeight:[1,2],clientWidth:[1,3],clientHeight:[1,3],screenTop:[1,5,function(){return"number"==typeof o.screenLeft?o.screenLeft:o.screenX}],screenLeft:[1,5,function(){return"number"==typeof o.screenTop?o.screenTop:o.screenY}],language:[2,1],oscpu:[2,1],location:[3,4,function(e){return e?encodeURIComponent(e.href.slice(0,255)):""}],timezone:[1,5,function(){var e=new Date;e.setDate(1),e.setMonth(5);var a=-e.getTimezoneOffset();e.setMonth(11);var r=-e.getTimezoneOffset();return Math.min(a,r)}],timestamp:[3,5,function(){return(new Date).getTime()}]}];return T.debug&&(e.cookie=p,e.ua=w),function(){if(!arguments.callee.invoked&&C){arguments.callee.invoked=!0,E=3,window.__flash__removeCallback=function(e,a){e&&(e[a]=null)},B();var e={xt:b.token||"",xa:b.appName||"",xh:""};try{if(b.enableMod&&w.mod){var n=f.isIE()?new ActiveXObject("Alim.webmod"):A;w.mod>=2001&&(n.timestamp=b.timestamp||"-"),e.xh=n.ciraw()}}catch(i){e.xh||(e.xh="")}var u;try{u=e.xs=p.get(c,!1)}catch(i){f.track("err-read-s")}try{for(var d=0;4>d;d++){var h=[],m=[],T=t[d];for(var S in T)T.hasOwnProperty(S)&&h.push(S);h=h.sort();for(var y=0,F=h.length;F>y;y++){var _=t[d][h[y]],k="";try{switch(_[1]){case 0:k="fonts"==h[y]?v&&M.getFontsMd5()||"":v&&M.getCapabilities(h[y])||"",k&&_[2]&&(k=_[2](k));break;case 1:k=l[h[y]]||"",k&&_[2]&&(k=_[2](k));break;case 2:k=o.screen[h[y]]||"",k&&_[2]&&(k=_[2](k));break;case 3:k=s.body[h[y]]||"",k&&_[2]&&(k=_[2](k));break;case 4:k=o[h[y]]||"",k&&_[2]&&(k=_[2](k));break;case 5:_[2]&&(k=_[2]())}}catch(i){}m.push(r(k,_[0]))}e["x"+d]=m.join("^^")}}catch(i){f.track("err-read")}e.xv=b.version;var D;for(D in e)e.hasOwnProperty(D)&&(a[D]=e[D]);if(b.noRequest){if("function"==typeof b.callback)try{b.callback()}catch(i){}}else{E=4;var L=function(){e.ext=g.getExtProps();try{f.jsonp(b.serviceUrl,function(e){if(H&&clearTimeout(H),e&&"id"in e?(E=255,u=e.id,u&&p.set(c,u),b.debug&&b.onCompleted&&b.onCompleted(e.id)):E=200,"function"==typeof b.callback)try{b.callback(e)}catch(a){}x=new Date;try{localStorage.setItem("_umid_cost",x-P);
}catch(a){}},e)}catch(a){}};if(I)if(R.length>=3)L();else var N=0,H=setInterval(function(){return R.length>=3?(L(),void clearInterval(H)):(N++,void(N>=3&&(L(),clearInterval(H))))},500);else L()}}}}(),_=function(){e.flashLoaded=function(){!arguments.callee.invoked&&C&&(arguments.callee.invoked=!0,v=!0,F())};var a=function(){var e='<embed height="1" width="1" id="umDcp" type="application/alidcp" class="umidWrapper" />';f.append(b.containers.dcp,e)},r=function(){var e='<object type="application/x-shockwave-flash" data="'+b.flashUrl+'" width="1" height="1" id="umFlash" class="umidWrapper">';e+='<param name="movie" value="'+b.flashUrl+'" /><param name="allowScriptAccess" value="always" /></object>',f.append(b.containers.flash,e)};return function(){if(!arguments.callee.invoked&&C){arguments.callee.invoked=!0,E=2;try{f.isIE()&&f.isIE()<11&&p.renderUserData()}catch(e){}try{b.enableMod&&!f.isIE()&&w.mod&&a()}catch(e){}if(w.flash[0]>=9)try{r()}catch(e){F()}else F()}}}()}(e),window.pointman?pointman.define("um",function(){return e}):window.um=e}();