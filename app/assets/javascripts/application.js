// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
// require turbolinks
//= require bootstrap-sprockets
//= require_tree .

console.log(5)

$(document).ready(function() {
    $("")

    $(".teacher-course-group").on('click', function () {
        var teacherID = $(this).data('teacher')
        var courseID = $(this).data('course')
        var groupID = $(this).data('group')
        var status = $(this).is(':checked')

        console.log(status)

        if (status) {
            $.post("/api/teacher/group/course", {
                    teacher_id: teacherID,
                    course_id: courseID,
                    group_id: groupID
                },
                function (res) {
                    console.log(res)
                }
            )
        } else {
            $.post("/api/teacher/group/course", {
                    teacher_id: teacherID,
                    course_id: courseID,
                    group_id: groupID,
                    _method: "delete"
                },
                function (res) {
                    console.log(res)
                }
            )
        }
    });
});