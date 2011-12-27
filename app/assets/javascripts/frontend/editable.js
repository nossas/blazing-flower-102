MR.EditableView = MR.BaseView.extend({

  initialize: function() {
    this.prepareEditables()
  },

  prepareEditables: function() {
    _.bindAll(this, "prepareEditable", "updateUrl")
    if(MR.editable){
      $.fn.editable.defaults.tooltip = MR.editable.defaults.tooltip;
      $.fn.editable.defaults.submit = MR.editable.defaults.submit;
      $.fn.editable.defaults.cancel = MR.editable.defaults.cancel;
      $.fn.editable.defaults.onblur = MR.editable.defaults.onblur;
    }

    this.$('.editable textarea').live('keydown', function() {
      if(!$(this).attr('data-prepared')) {
        $(this).attr('maxlength', $(this).parents('.editable').attr('data-maxlength'))
        $(this).maxlength()
        var space = ($(this).parents('.editable').attr('data-singleline')) ? 0 : 100
        $(this).autoResize({ extraSpace: space })
        $(this).attr('data-prepared', true)
      }
    })
    this.$('.editable textarea').live('focus', this.positionButtons)
    this.$('.editable textarea').live('keyup', this.positionButtons)
    this.$('.editable textarea').live('keydown', this.keydown)
    this.$('.editable').each(this.prepareEditable)
  },

  prepareEditable: function(index, element) {
    element = $(element)
    element.click(function(){
      $(this).addClass("editing")
    })
    _.bind(this.dataRaw, element)
    element.editable(this.updateUrl(element), {
      data: this.dataRaw,
      type: (element.attr('data-type') || "textarea"),
      placeholder: element.attr('data-placeholder'),
      method: "PUT",
      name: this.modelName + '[' + element.attr('data-attribute') + ']',
      indicator : '<img src="/assets/imagine/loading.gif">',
      onreset: function() {
        $(this).parent().removeClass("editing")
        if (!$(this).parents('.editable').attr('data-singleline'))
          $('#idea_description .menu').fadeIn();
      },
      callback: function(value, settings) {
        var model = JSON.parse(value)
        $(this).attr('data-raw', model[$(this).attr('data-attribute')])
        $(this).html(model[($(this).attr('data-raw-attribute') || $(this).attr('data-attribute'))])
        $(this).removeClass("editing")
        if (!$(this).parents('.editable').attr('data-singleline'))
          $('#idea_description .menu').fadeIn();
      }
    })
  },

  positionButtons: function() {
    element = $(this)
    var form = element.parents('form')
    var submit = form.find('button[type=submit]')
    var cancel = form.find('button[type=cancel]')
    var left = element.offset().left + element.width()
    var top = element.offset().top + element.height() + 4
		submit.css('position', 'relative')
		submit.css('display', 'inline')
		cancel.css('display', 'inline')
    if (!$(this).parents('.editable').attr('data-singleline'))
      $('#idea_description .menu').fadeOut();
  },

  keydown: function(event) {
    if (event.keyCode == '13' && $(this).parents('.editable').attr('data-singleline')) {
      event.preventDefault()
      $(this).parents('form').find('button[type=submit]').click()
      return false
    }
  },

  collectionName: function() {
    return this.modelName + 's'

  },

  updateUrl: function(element) {
    return $(element).attr('data-url') + '.json'
  },

  dataRaw: function(){ return $(this).attr('data-raw') }

})

