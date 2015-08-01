CKEDITOR.editorConfig = function(config){
  config.fullPage = false
  config.extraPlugins = 'docprops'
  config.skin = 'kama'
  config.uiColor = '#eeee99'
  config.defaultLanguage = 'zh-TW'
  config.disableNativeSpellChecker = true
  config.disableNativeTableHandles = true
  config.disableReadonlyStyling = true
  config.toolbarCanCollapse = false;
  config.language = 'zh-TW'
  config.enterMode = CKEDITOR.ENTER_BR
  config.shiftEnterMode = CKEDITOR.ENTER_BR
  config.resize_minWidth = 776;
  
  config.height = "238";
  config.width = "776";
/*
  config.toolbar = 'simple';
  config.toolbar_simple = [
    {name:'clipboard',items:['Cut','Copy','PasteText' , '-' , 'Undo','Redo']},
    {name:'basicstyles',items:['Image','-','Bold','Italic','Underline','Strike','-','JustifyLeft','JustifyCenter','JustifyRight','-','TextColor','BGColor','Link','Unlink','-','RemoveFormat']},
    {name:'styles',items:['Font','FontSize']},
    {name:'tools',items:['Maximize','Source']}
  ];
*/


  config.extraPlugins = 'uploadify';


  config.toolbar = 'normal';
  config.toolbar_normal = [
    {name:'tool01',items:['Undo','Redo','-','Cut','Copy','Paste']},
    {name:'tool02',items:['Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','TextColor','BGColor','-','Link','Unlink','-','Image']},
    {name:'tool03',items:['Format','FontSize','Font']},
    '/',
    {name:'tool04',items:['NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Outdent','Indent']},
    {name:'tool05',items:['Flash','Table','HorizontalRule','-','Blockquote','CreateDiv']},
    {name:'tool06',items:['RemoveFormat','-','SelectAll','PasteText','PasteFromWord','SpecialChar']},
    {name:'tool07',items:['uploadify','Find','Replace','Maximize','ShowBlocks','Preview','Source']}
  ];
};