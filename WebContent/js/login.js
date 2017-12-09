/**
 * Created by ypj on 17-12-2.
 */

function check() {
	var reg = /^[0-9]{6}&/;
	var item = document.getElementById("inputUser");
	if (!reg.test(item))
		document.getElementById("tip").innerText = "请输入有效用户名！";
}
function recover() {
	document.getElementById("tip").innerText = "";
}
