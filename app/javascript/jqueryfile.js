
$(document).ready(function() {
  $('.category-dropdown').select2();
});

$(document).ready(function () {

  $.validator.addClassRules('tag-input-field', {
    required: true,
      messages: {
      required: "Tags can't be blank"
      }
  })

  $('#form1').validate({

    rules:{
    "post[title]": {
      required : true
    },
    "post[body]": {
      required : true,
      minlength: 10
    },
    "post[image]": {required:true}

    },

    messages:{
      "post[title]": {
      required : "Title can't be blank"
    },
    "post[body]": {
      required : "Body can't be blank",
      minlength: "Body too short [Min. 10 characters]"
    },
    "post[image]": {required:"Please provide Image"},
    }

  })

}); 
