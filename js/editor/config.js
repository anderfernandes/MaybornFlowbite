if ("CKEDITOR" in window) {
  CKEDITOR.editorConfig = function (config) {
    config.extraAllowedContent = "template[*]";
  };

  CKEDITOR.instances.body.on("instanceReady", function (e) {
    e.editor.dataProcessor.writer.setRules("template", {
      indent: true,
      breakBeforeOpen: true,
      breakAfterOpen: true,
      breakBeforeClose: true,
      breakAfterClose: true,
    });
  });
}
