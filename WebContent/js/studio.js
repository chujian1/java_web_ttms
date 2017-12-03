/**
 *
 * Created by ypj on 17-12-2.
 */


var rowIndex;

function del(obj) {
    var del_tr = obj.parentNode.parentNode;
    var del_body = document.getElementById("listTable");
    del_body.removeChild(del_tr);
}

function edit(obj) {
    var edit_id = document.getElementById("name");
    var edit_status = document.getElementById("status");
    var edit_level = document.getElementById("level");
    var edit_tr = obj.parentNode.parentNode;
    var edit_td = edit_tr.getElementsByTagName("td");
    rowIndex = edit_tr.rowIndex;
    edit_id.value = edit_td[0].innerHTML;
    edit_status.value = edit_td[1].innerHTML;
    edit_level.value = edit_td[2].innerHTML;

}

function update() {
    var update_table = document.getElementById("myTable");
    var update_id = document.getElementById("name");
    var update_status = document.getElementById("status");
    var update_level = document.getElementById("level");
    update_table.rows[rowIndex].cells[0].innerHTML = update_id.value;
    update_table.rows[rowIndex].cells[1].innerHTML = update_status.value;
    update_table.rows[rowIndex].cells[2].innerHTML = update_level.value;
}

function add() {
    var add_id = document.getElementById('name').value;
    var add_status = document.getElementById("status").value;
    var add_level = document.getElementById("level").value;
    var add_tr = document.createElement('tr');
    var add_td_0 = document.createElement('td');
    var add_td_1 = document.createElement('td');
    var add_td_2 = document.createElement('td');
    var add_td_3 = document.createElement('td');
    var add_td_4 = document.createElement('td');
    var add_td_5 = document.createElement('td');
    var add_td_6 = document.createElement('td');

    add_td_0.innerHTML = add_id;
    add_td_1.innerHTML = add_status;
    add_td_2.innerHTML = add_level;

    if(add_level == 'VIP'){
        add_td_3.innerHTML = 6;
        add_td_4.innerHTML = 8;
    }
    else if(add_level == '2D'){
        add_td_3.innerHTML = 10;
        add_td_4.innerHTML = 12;
    }
    else {
        add_td_3.innerHTML = 8;
        add_td_4.innerHTML = 10;
    }
    var add_del = document.createElement("button");
    var add_span_1 = document.createElement("span");
    add_del.setAttribute('type','button');
    add_del.className = 'btn btn-info btn-sm';
    add_del.setAttribute('onclick','del(this)');
    add_span_1.className = 'glyphicon glyphicon-remove';
    add_del.appendChild(add_span_1);
    add_td_5.appendChild(add_del);

    var add_edit = document.createElement("button");
    var add_span_2 = document.createElement('span');
    add_edit.setAttribute('type','button');
    add_edit.className ='btn btn-info btn-sm';
    add_edit.setAttribute('data-toggle','modal');
    add_edit.setAttribute('data-target','#myModal');
    add_edit.setAttribute('onclick','edit(this)');
    add_span_2.className = 'glyphicon glyphicon-edit';
    add_edit.appendChild(add_span_2);
    add_td_6.appendChild(add_edit);

    add_tr.appendChild(add_td_0);
    add_tr.appendChild(add_td_1);
    add_tr.appendChild(add_td_2);
    add_tr.appendChild(add_td_3);
    add_tr.appendChild(add_td_4);
    add_tr.appendChild(add_td_5);
    add_tr.appendChild(add_td_6);

    var add_body = document.getElementById('listTable');
    add_body.appendChild(add_tr);


}