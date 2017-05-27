$(document).ready(function() {
     $('a.edit_route_name').click(function(e) {
        e.preventDefault();
        
        var route_id;
        var form;
        var name;

        route_id = $(this).data('routeId');
        form = $('#edit_route_name_' + route_id);
        name = $('#route_name_' + route_id);

        console.log(form);
        console.log(name);

        form.toggle();
        name.toggle();
    });
});