<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>服务器平台</title>

    <meta name="description" content="Static &amp; Dynamic Tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

    <#include "fragment/css.ftl"/>
</head>

<body class="no-skin">
<div id="navbar" class="navbar navbar-default ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header">
            <a href="index.ftl" class="navbar-brand">
                <small> <i class="fa fa-leaf"></i> 服务器平台 </small>
            </a>
        </div>
    </div>
    <!-- /.navbar-container -->
</div>

<div class="main-container ace-save-state" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="ace-settings-container" id="ace-settings-container">
                    <div class="ace-settings-box clearfix" id="ace-settings-box">
                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <div class="pull-left">
                                    <select id="skin-colorpicker" class="hide">
                                        <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                        <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                        <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                        <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                    </select>
                                </div>
                                <span>&nbsp; Choose Skin</span>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar"
                                       autocomplete="off" />
                                <label class="lbl" for="ace-settings-navbar">
                                    Fixed Navbar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar"
                                       autocomplete="off" />
                                <label class="lbl" for="ace-settings-sidebar">
                                    Fixed Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs"
                                       autocomplete="off" />
                                <label class="lbl" for="ace-settings-breadcrumbs">
                                    Fixed Breadcrumbs</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"
                                       autocomplete="off" />
                                <label class="lbl" for="ace-settings-rtl">
                                    Right To Left (rtl)</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container"
                                       autocomplete="off" />
                                <label class="lbl" for="ace-settings-add-container">
                                    Inside <b>.container</b>
                                </label>
                            </div>
                        </div>
                        <!-- /.pull-left -->

                        <div class="pull-left width-50">
                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"
                                       autocomplete="off" />
                                <label class="lbl" for="ace-settings-hover"> </label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"
                                       autocomplete="off" />
                                <label class="lbl" for="ace-settings-compact"> </label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"
                                       autocomplete="off" />
                                <label class="lbl" for="ace-settings-highlight"> </label>
                            </div>
                        </div>
                        <!-- /.pull-left -->
                    </div>
                    <!-- /.ace-settings-box -->
                </div>
                <!-- /.ace-settings-container -->

                <!-- 服务器 -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <h3 class="header smaller lighter blue">服务器</h3>

                                <div class="clearfix">
                                    <div class="pull-right tableTools-container"></div>
                                </div>

                                <!-- div.dataTables_borderWrap -->
                                <div>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" role="add-server">
                                        <i class="glyphicon glyphicon-plus">添加</i>
                                    </button>
                                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>IP</th>
                                            <th>说明</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <#if list??>
                                            <#list list as e>
                                        <tr>
                                            <td><a href="#">${(e.ip)!''}</a></td>
                                            <td>${(e.note)!''}</td>
                                            <td>
                                                <#if e.status==1>
                                                    <span class="label label-sm label-success">健康</span>
                                                <#else>
                                                    <span class="label label-sm label-warning">病态</span>
                                                </#if>
                                            </td>
                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <button class="btn btn-xs btn-success">
                                                        <i class="ace-icon fa fa-search">查看详情</i>
                                                    </button>

                                                    <button class="btn btn-xs btn-primary" role="update-server">
                                                        <i class="ace-icon fa fa-pencil-square-o">修改</i>
                                                    </button>

                                                    <button class="btn btn-xs btn-danger" role="delete-server" >
                                                        <i class="ace-icon fa fa-trash-o">删除</i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                            </#list>
                                        </#if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.col -->
                </div>

                <!-- 服务 -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <h3 class="header smaller lighter blue">服务</h3>

                                <div class="clearfix">
                                    <div class="pull-right tableTools-container"></div>
                                </div>

                                <div>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_service">
                                        <i class="glyphicon glyphicon-plus">添加</i>
                                    </button>
                                    <table id="service_tab" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th>服务名称</th>
                                            <th>服务</th>
                                            <th>IP/端口号</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <tr>
                                            <td>MySQL</td>
                                            <td class="center">
                                                <div class="action-buttons">
                                                    <a href="#" class="green bigger-140 show-details-btn" title="显示服务">
                                                        <i class="ace-icon fa fa-angle-double-down"></i>
                                                        <span class="sr-only">服务</span>
                                                    </a>
                                                </div>
                                            </td>
                                            <td>192.168.0.1::3306</td>
                                            <td>
                                                <span class="label label-sm label-warning">病态</span>
                                            </td>
                                            <td>
                                                <button class="btn btn-xs btn-danger" id="delete_one">
                                                    <i class="ace-icon fa fa-trash-o bigger-120">删除</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr class="detail-row">
                                            <td colspan="8">
                                                <div class="table-detail">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-1">
                                                            <div class="text-center">
                                                                <img height="94" class="thumbnail inline no-margin-bottom"
                                                                     alt="" src="./images/image-1.jpg" >
                                                                <br>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-11">
                                                            <div class="space visible-xs"></div>

                                                            <div class="profile-user-info profile-user-info-striped">
                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 名称
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 说明
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 操作
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="table-detail">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-1">
                                                            <div class="text-center">
                                                                <img height="94" class="thumbnail inline no-margin-bottom"
                                                                     alt="" src="./images/image-1.jpg" >
                                                                <br>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-11">
                                                            <div class="space visible-xs"></div>

                                                            <div class="profile-user-info profile-user-info-striped">
                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 名称
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 说明
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 操作
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>


                                        </tr>
                                        <tr>
                                            <td>文档</td>
                                            <td class="center">
                                                <div class="action-buttons">
                                                    <a href="#" class="green bigger-140 show-details-btn" title="显示服务">
                                                        <i class="ace-icon fa fa-angle-double-down"></i>
                                                        <span class="sr-only">服务</span>
                                                    </a>
                                                </div>
                                            </td>
                                            <td>192.168.0.1::3306</td>
                                            <td class="hidden-480">
                                                <span class="label label-sm label-success">健康</span>
                                            </td>
                                            <td><button class="btn btn-xs btn-danger" id="delete_one">
                                                <i class="ace-icon fa fa-trash-o bigger-120">删除</i>
                                            </button>
                                            </td>
                                        </tr>
                                        <tr class="detail-row">
                                            <td colspan="8">
                                                <div class="table-detail">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-1">
                                                            <div class="text-center">
                                                                <img height="94" class="thumbnail inline no-margin-bottom"
                                                                     alt="" src="./images/image-1.jpg" >
                                                                <br>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-11">
                                                            <div class="space visible-xs"></div>

                                                            <div class="profile-user-info profile-user-info-striped">
                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 名称
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 说明
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 操作
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="table-detail">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-1">
                                                            <div class="text-center">
                                                                <img height="94" class="thumbnail inline no-margin-bottom"
                                                                     alt="" src="./images/image-1.jpg" >
                                                                <br>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-11">
                                                            <div class="space visible-xs"></div>

                                                            <div class="profile-user-info profile-user-info-striped">
                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 名称
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 说明
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>

                                                                <div class="profile-info-row">
                                                                    <div class="profile-info-name"> 操作
                                                                    </div>

                                                                    <div class="profile-info-value">
                                                                        <span></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>


                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.col -->
                </div>

                <!-- /.row -->

                <!-- 日志 -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <h3 class="header smaller lighter blue">操作日志</h3>

                                <div class="clearfix">
                                    <div class="pull-right tableTools-container"></div>
                                </div>

                                <div>
                                    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th class="center">
                                                <label class="pos-rel">
                                                    <input type="checkbox" class="ace" />
                                                    <span class="lbl"></span>
                                                </label>
                                            </th>
                                            <th>日志编号</th>
                                            <th class="hidden-480">创建时间</th>
                                            <th class="hidden-480">修改时间</th>
                                            <th>备注</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>

                                        <tbody>
                                        <tr>
                                            <td class="center">
                                                <label class="pos-rel">
                                                    <input type="checkbox" class="ace" />
                                                    <span class="lbl"></span>
                                                </label>
                                            </td>

                                            <td><a href="#">S20190123</a></td>
                                            <td>2019-1-23</td>
                                            <td class="hidden-480">2019-1-23</td>
                                            <td></td>
                                            <td>
                                                <div class="hidden-sm hidden-xs btn-group">
                                                    <button class="btn btn-xs btn-success">
                                                        <i class="ace-icon fa fa-check bigger-120">查看</i>
                                                    </button>

                                                    <button class="btn btn-xs btn-danger">
                                                        <i class="ace-icon fa fa-trash-o bigger-120">删除</i>
                                                    </button>
                                                </div>

                                                <div class="hidden-md hidden-lg">
                                                    <div class="inline pos-rel">
                                                        <button class="btn btn-minier btn-primary dropdown-toggle"
                                                                data-toggle="dropdown" data-position="auto">
                                                            <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                                        </button>

                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                            <li>
                                                                <a href="#" class="tooltip-info" data-rel="tooltip"
                                                                   title="View">
                                                                            <span class="blue">
                                                                                <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                                            </span>
                                                                </a>
                                                            </li>

                                                            <li>
                                                                <a href="#" class="tooltip-success" data-rel="tooltip"
                                                                   title="Edit">
                                                                            <span class="green">
                                                                                <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                                                            </span>
                                                                </a>
                                                            </li>

                                                            <li>
                                                                <a href="#" class="tooltip-error" data-rel="tooltip"
                                                                   title="Delete">
                                                                            <span class="red">
                                                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                                            </span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- PAGE CONTENT ENDS -->
                    </div>
                    <!-- /.col -->
                </div>
            </div>

            <!-- 添加服务器模态框 -->
            <div class="modal fade" id="add_server" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content" style="padding: 15px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                <span class="sr-only">Close</span></button>
                            <h4 class="modal-title">添加服务器</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <form action="save" method="post" id="filter">
                                    <div class="form-group">
                                        <label for="ip">IP</label>
                                        <input type="text" class="form-control" name="ip" id="ip" placeholder="服务器IP">
                                    </div>
                                    <div class="form-group">
                                        <label for="note">说明</label>
                                        <textarea class="form-control" id="note" name="note" rows="3" placeholder="说明"></textarea>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary conform-but">添加</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 修改你服务器 -->
            <div class="modal fade" id="update_server" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content" style="padding: 15px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                <span class="sr-only">Close</span></button>
                            <h4 class="modal-title">修改</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <form action="update" method="post" id="filter">
                                    <div class="form-group">
                                        <label for="ip">IP</label>
                                        <input type="text" class="form-control" name="ip" id="ip" placeholder="服务器IP">
                                    </div>
                                    <div class="form-group">
                                        <label for="note">说明</label>
                                        <textarea class="form-control" id="note" name="note" rows="3" placeholder="说明"></textarea>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary conform-but">修改</button>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 添加服务模态框 -->
            <div class="modal fade" id="add_service" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content" style="padding: 15px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                <span class="sr-only">Close</span></button>
                            <h4 class="modal-title">添加服务</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <form action="#" method="post" id="filter-contract">
                                    <div class="form-group">
                                        <label for="servicename">服务名称</label>
                                        <input type="text" class="form-control" id="sername" name="servicename"
                                               placeholder="服务名称">
                                    </div>
                                    <div class="form-group">
                                        <label for="pnumber">IP/端口号</label>
                                        <input type="text" class="form-control" id="pnum" name="pnumber"
                                               placeholder="端口号">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary conform-but" id="add_btn2">添加</button>
                        </div>
                    </div>
                </div>
            </div>

            <#include "fragment/js.ftl"/>
</body>

</html>