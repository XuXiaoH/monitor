$(function () {
    //添加服务器
    $('body').on('click','[role="add-server"]',function () {//点击添加按钮
        $.showModal("add_server",function () {//显示模态框
            $.localFormAjax('filter',function () {//传数据
                alert('操作成功！',function () {//返回结果
                    history.go(0);
                });
            })
        })
    });

    //服务器修改
    $('body').on('click','[role="update-server"]',function () {
        var self=$(this);
        var id=self.attr("tag");
        $.localAjax("get",{id:id},function (res) {
            $("#id").val(res.data.id);
            $("#ip").val(res.data.ip);
            $("#note").val(res.data.note);
            $("#status").val(res.data.status);
            $.showModal("update_server",function () {
                $.localFormAjax("update-filter",function () {
                    alert("修改成功！");
                    history.go(0);
                });
            })
        })
    });

    // 删除服务器
    $('body').on('click','[role="delete-server"]',function () {
        var self=$(this);
        var id=self.attr('tag');
        myConfirm("确认删除吗？",function () {
            $.localAjax('get',{id:id},function () {
                alert("操作成功！",function () {
                    history.go(0);
                });
            })
        });
    });






})