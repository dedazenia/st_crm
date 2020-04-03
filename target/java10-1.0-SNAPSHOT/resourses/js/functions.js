function modifyDiscipline() {

    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Пожалуйста, выберите одну дисциплину");
        return;
    }
    if (items.length > 1) {
        alert("Пожалуйста, выберите ТОЛЬКО одну дисциплину");
        return;
    }

    var id = $(items[0]).attr("value");
    $('#formModifyingDiscipline input').val(id);
    $('#formModifyingDiscipline').submit();

}

function deleteDisciplines() {

    var items = $("input[type=checkbox]:checked");
    if (items.length == 0) {
        alert("Пожалуйста, выберите хотя бы одну дисциплину");
        return;
    }

    var ids;

    for (var i = 0; i < items.length; i++) {
        if (ids == null) {
            ids = "'" + $(items[i]).attr("value");
        } else {
            ids = ids + "','" + $(items[i]).attr("value");
        }
        if (i == items.length - 1) {
            ids = ids + "'"
        }
    }

    $('#idsDeleteDisc').val(ids);
    $('#formDeleteDisciplines').submit();
}

