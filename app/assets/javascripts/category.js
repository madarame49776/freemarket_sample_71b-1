$(function(){
  let buildPrompt = `<option value>---</option>`
  let buildHtmlOption = function(parent) {
    let option = `<option value ="${parent.id}">${parent.name}</option>`
    return option
  }
  $('#parent').change(function() {
    let parent_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: 'products/new/children_category',
      data: {parent_category_id: parent_id},
      dataType: 'json'
    })
    .done(function(parent) {
      $('.child').css('display', 'block');
        $('#child').empty();
        $('.grand_child').css('display', 'none');
        $('#child').append(buildPrompt);

      parent.forEach(function(child) {
        var html_option = buildHtmlOption(child);
        $('#child').append(html_option);
      });
    })
    .fail(function() {
      alert('エラー')
    });
  });
  $(this).on("change", "#child", function() {
    let parent_id = $("#parent").val();
    let child_id = $("#child").val();
    $.ajax({
        type: 'GET',
        url: 'products/new/grandchildren_category',
        data: {
          parent_category_id: parent_id,
          children_category_id: child_id
        },
        dataType: 'json'
    })
    .done(function(parent) {
      $('.grand_child').css('display', 'block');
      $('#grand_child').empty();
      $('#grand_child').append(buildPrompt);

       parent.forEach(function(child) {
        var html_option = buildHtmlOption(child);
         console.log(buildHtmlOption(html_option));
        $('#grand_child').append(html_option);
      });
    })
  });
})
