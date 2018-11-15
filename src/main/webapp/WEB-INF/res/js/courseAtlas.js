$(document).ready(function () {
    course_down();//下拉课程
});
//下拉课程
function course_down() {
    $(".a_fold").click(function () {
        $(this).nextAll(".course_down").slideToggle(1000);
    })
}