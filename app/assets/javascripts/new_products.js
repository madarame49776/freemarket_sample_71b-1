$(function(){
  //DataTransferオブジェクトで、データを格納する箱を作る
  var dataBox = new DataTransfer(); //ステップ②
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#img-file').change(function(){
    //選択したfileのオブジェクトをpropで取得
    var files = $('input[type=file]').prop('files')[0];
    $.each(this.files, function(i,file){
    //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
    var fileReader = new FileReader();

    //DataTransferオブジェクトに対して、fileを追加
    dataBox.items.add(file) //ステップ②
    //dataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
    file_field.files =  dataBox.files //ステップ②

    var num = $('.item-image').length + 1 + i //ステップ②
    fileReader.readAsDataURL(file); //ステップ②
     //画像が10枚になったら超えたらドロップボックスを削除する
     if (num == 5){ //ステップ②
      $('#image-box__container').css('display', 'none')
     }
    //読み込みが完了すると、srcにfileのURLを格納
    fileReader.onloadend = function() {
      var src = fileReader.result
      var html = `<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="150" height="90" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
     //image_box__container要素の前にhtmlを差し込む
      $('#image-box__container').before(html);
      };
    //   fileReader.readAsDataURL(file);
    //  });
     //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
     $('#image-box__container').attr('class', `item-num-${num}`)
    });
  });
    $(document).on("click", '.item-image__operetion--delete', function(){
      //プレビュー要素を取得
      var target_image = $(this).parent().parent()
      //プレビューを削除
      target_image.remove();
      //inputタグに入ったファイルを削除
      file_field.val("")
    })
});


































































//=========================================================================================================









// $(function(){
//   const buildFileField = (num)=>  {
//     const html = `<div class="input-field__contents-image__drop__js-file" data-index="${num}">
//                     <input class="image-input" type="file" name="product[images_attributes][${num}][name]" 
//                     id="product_images_attributes_${num}_name"> <br>
//                   </div>
//                   `;
//         return html;
//   }
//   // プレビュー用のimgタグを生成する関数

//   const buildImg = (index, url)=> {
//     const html = `<div class = "image_preview">
//                   <img data-index="${index}" src="${url}" width="160px" height="90%">
//                   <span class="js-remove">削除</span>
//                   </div>
//                  `;
//     // console.log(html);
//     return html;
//   }

//   const buildLabel = (num)=> {
//     const html = `<label class="input-field__contents-image__drop">
//                   <div class="input-field__contents-image__drop__js-file" data-index="${num}">
//                   <input class="image-input" type="file" name="product[images_attributes][${num}][name]" 
//                   id="product_images_attributes_${num}_name"
//                   </div>
//                   `;
//     return html;
//     }



//   let fileIndex = [1,2,3,4,5,6,7,8,9,10];


//   // 既に使われているindexを除外
//   lastIndex = $('.input-field__contents-image__drop__js-file:last').data('index');
//   fileIndex.splice(0, lastIndex);
  
//   // $('.hidden-destroy').hide();


//   // $('#image-box-1').on('change', '.image-input', function(e) {

//     $('#image-box-1').on('change', '.input-field__contents-image__drop__js-file', function(e) {   

//     const targetIndex = $(this).data('index');
//     // ファイルのブラウザ上でのURLを取得する
//     const file = e.target.files[0];
//     const blobUrl = window.URL.createObjectURL(file);
    

//     // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)

//     if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
//       img.setAttribute('name', blobUrl);
//     } else {  // 新規画像追加の処理
      
//       if(targetIndex <= 4  ){
//         $('#previews').before(buildImg(targetIndex, blobUrl))
//         $(' .input-field__contents-image__drop ').css({
//           'width': `calc(100% - (20% * ${targetIndex + 1} ))`
//         })
//         if(targetIndex == 4) {
//           // console.log('1')
//           $('#previews2').append(buildLabel(targetIndex, blobUrl))
//         }
//       }
//       else if(targetIndex >= 5 && targetIndex <= 8){
//         $('#previews2').before(buildImg(targetIndex, blobUrl))

//         $(' .input-field__contents-image__drop ').css({
//           'width': `calc(100% - (20% * ${targetIndex + 1} ))`
//         })
//       }
//       else if(targetIndex == 10 ){
//         $('.input-field__contents-image__drop ').css('display', 'none')   
//         // $('.image_preview').css({
//         //   'width': `calc(100% - (20% * (${targetIndex} - 5 )))`
//         // })
//       }

//       // fileIndexの先頭の数字を使ってinputを作る
//       $('.input-field__contents-image__drop__js-file ').hide();
//       $('.input-field__contents-image__drop ').append(buildFileField(fileIndex[0])); 
//       fileIndex.shift();
//       // 末尾の数に1足した数を追加する
//       fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
//     }
//   });

//   $('#image-box-1').on('click', '.js-remove', function() {
//     const targetIndex = $(this).parent().data('index');
//     // 該当indexを振られているチェックボックスを取得する
//     const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
//     // もしチェックボックスが存在すればチェックを入れる
//     if (hiddenCheck) hiddenCheck.prop('checked', true);

//     $(this).parent().remove();
//     // 画像入力欄が0個にならないようにしておく
//     if ($('.image-input').length == 0) $('#image-box-1').append(buildFileField(fileIndex[0]));
//   });

// });