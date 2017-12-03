/**
 * Created by ypj on 17-12-2.
 */

var rowIndex;

function del(obj) {
    var del_tr = obj.parentNode.parentNode;
    var del_body = document.getElementById("listTable");
    del_body.removeChild(del_tr);
}

function edit(obj) {
    var edit_num = document.getElementById("num");
    var edit_name = document.getElementById("name");
    var edit_tel = document.getElementById("tel");
    var edit_addr = document.getElementById("addr");
    var edit_email = document.getElementById("email");
    var edit_tr = obj.parentNode.parentNode;
    var edit_td = edit_tr.getElementsByTagName("td");
    rowIndex = edit_tr.rowIndex;
    edit_num.value = edit_td[0].innerHTML;
    edit_name.value = edit_td[1].innerHTML;
    edit_tel.value = edit_td[2].innerHTML;
    edit_addr.value = edit_td[3].innerHTML;
    edit_email.value = edit_td[4].innerHTML;

}

function update() {
    var update_table = document.getElementById("myTable");
    var update_num = document.getElementById("num");
    var update_name = document.getElementById("name");
    var update_tel = document.getElementById("tel");
    var update_addr = document.getElementById("addr");
    var update_email = document.getElementById("email");
    update_table.rows[rowIndex].cells[0].innerHTML = update_num.value;
    update_table.rows[rowIndex].cells[1].innerHTML = update_name.value;
    update_table.rows[rowIndex].cells[2].innerHTML = update_tel.value;
    update_table.rows[rowIndex].cells[3].innerHTML = update_addr.value;
    update_table.rows[rowIndex].cells[4].innerHTML = update_email.value;
}

function add() {
    var add_num = document.getElementById('num').value;
    var add_name = document.getElementById('name').value;
    var add_tel = document.getElementById("tel").value;
    var add_addr = document.getElementById("addr").value;
    var add_email = document.getElementById('email').value;
    var add_tr = document.createElement('tr');
    var add_td_0 = document.createElement('td');
    var add_td_1 = document.createElement('td');
    var add_td_2 = document.createElement('td');
    var add_td_3 = document.createElement('td');
    var add_td_4 = document.createElement('td');
    var add_td_5 = document.createElement('td');
    var add_td_6 = document.createElement('td');

    add_td_0.innerHTML = add_num;
    add_td_1.innerHTML = add_name;
    add_td_2.innerHTML = add_tel;
    add_td_3.innerHTML = add_addr;
    add_td_4.innerHTML = add_email;

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
