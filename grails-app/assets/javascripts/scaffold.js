/**
 * Created by shipra on 28/5/15.
 */
$('#change li').on('click',function(){
    $('#change li').removeClass('active');
    $('#change li').attr('class');
    $(this).addClass('active');
});

$(document).ready(function(){
   var message=$('#message').val();
    if(message!=null)
        $.toast(message);


    $('#datepicker').datepicker({
        dateFormat:'dd-mm-yy'
    }).val();
});



