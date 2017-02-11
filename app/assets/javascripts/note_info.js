get_note_info();

function get_note_info(){
    console.log('eeeeeeeeeeeeee');
    var note_id = sessionStorage.getItem('note_id');
    console.log(note_id);
    get_ajax('http://localhost:3000/note_info/get_note',{note_id:note_id},
        function(data){

        },
        function(){

        }
    )
}