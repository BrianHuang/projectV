CKEDITOR.plugins.add("uploadify",{
  requires:['iframedialog'],
  init:function(editor){
    var commandName = "uploadify";
    editor.addCommand(commandName,{
      exec:function(editor){
        editor.openDialog(commandName);
      }
    });
    editor.ui.addButton(commandName,{
      label:'Uploader',
      command:commandName,
      icon:this.path + "images/icon.png"
    });
    CKEDITOR.dialog.add(commandName, CKEDITOR.dialog.addIframe(commandName, null, '/users/admin/uploads/manager', '100%' , '100%' , function(){
      //console.log('is loaded2')
    },{
      width:'800',
      height:'450',
      onCancel:function(){/*console.log('Lcancel')*/},
      onLoad:function(){/*console.log('Lload')*/},
      onOk:function(){/*console.log('Lok')*/},
      onShow:function(){/*console.log('Lshow')*/},
      buttons:[],
      resizable:false,
      title:'Uploader'
    }));
  }
})