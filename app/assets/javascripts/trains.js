$(document).ready(function() {
     $('a.edit_train_number').click(function(e) {
        e.preventDefault();
        
        var train_id;
        var form;
        var number;

        train_id = $(this).data('trainId');
        form = $('#edit_train_number_' + train_id);
        number = $('#train_number_' + train_id);

        form.toggle();
        number.toggle();
    });
});