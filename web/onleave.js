function selectAllLeacture(allSelectLectureCheckBox) 
{

  
    

    var LectureCheckBoxes = document.querySelectorAll('.lectureCheckBox');
     document.getElementsByName("ss").value="dddd";

    // Loop through each checkbox and set its checked property
    LectureCheckBoxes.forEach(function (lectureCheckBox) 
    {
        lectureCheckBox.checked = allSelectLectureCheckBox.checked;
    });
   
   
}