if ("CKEDITOR" in window) {
  CKEDITOR.editorConfig = function (config) {
    config.allowedContent = true;
    config.entities = false;
    config.basicEntities = false;
  };

  CKEDITOR.instances.body.on("instanceReady", function (e) {
    CKEDITOR.dtd.a.div = 1;
    CKEDITOR.dtd.a.img = 1;
    CKEDITOR.dtd.a.h2 = 1;
    CKEDITOR.dtd.a.p = 1;
    e.editor.dataProcessor.writer.setRules("template", {
      indent: true,
      breakBeforeOpen: true,
      breakAfterOpen: true,
      breakBeforeClose: true,
      breakAfterClose: true,
    });
  });
}
