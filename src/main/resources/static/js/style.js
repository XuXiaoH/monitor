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
    /*$('body').on('click','[role="update-server"]',function () {
        $.showModal("update_server",function () {
            $.localFormAjax()

        })
    })*/

    /*$('body').on('click','[role="delete-server"]',function () {
        var self=$(this);
        var id=self.attr('tag');
        myConfirm("确认删除吗？",function () {
            $.localAjax({id:id},function () {
                alert("操作成功！",function () {
                    history.go(0);
                });
            })
        });
    });*/






})