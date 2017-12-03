/**
 * Created by ypj on 17-12-2.
 */
function check() {
    const user = document.form.user.value;
    const passwd = document.form.password.value;
    if(user == "adm" && passwd == "123456"){
        return true;
    }
    else
    {
        alert("please input valid user and passwd");
        document.getElementById("inputPassword").value="";
        return false;
    }
}
