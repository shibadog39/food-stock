//初回読み込み、リロード、ページ切り替えで動く。
$(document).on('turbolinks:load', function() {
  $("#sortable").sortable({
    update: updateSequence});
});

function updateSequence(){
  const $sortableTbody = document.querySelector("#sortable")
  $sortableTbody.querySelectorAll(".hidden-sequence").forEach(($input, index) => {
    $input.value = index + 1
  })
}
