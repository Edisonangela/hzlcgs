# encoding: utf-8
module ApplicationHelper
  def ext_layout
     function = " Ext.onReady(function(){


       Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

       var viewport = new Ext.Viewport({
            layout:'border',
            items:[
             // {
              //region:'west',
             //  id:'west-panel',
             // title:'功能菜单',
            //   split:true,
            //  width: 118,
            //   minSize: 175,
            //    maxSize: 400,
            //   collapsible: true,
            //    margins:'0 0 5 5',
            //   cmargins:'35 5 5 5',
            //    layout:'column',
             // contentEl:'sidebar'
              
             
           //},
            {
                    region:'west',
                    id:'west-panel',
                    
                    title:'功能菜单',
                    split:true,
                    width: 118,
                    minSize: 175,
                    maxSize: 400,
                    collapsible: true,
                    margins:'0 0 0 5',
                    layout:'accordion',
                    layoutConfig:{
                        animate:true
                    },
                    items: [{
                        contentEl: 'sidebar_shangpinbeian',
                        title:'商品备案',
                        border:false,
                        iconCls:'folder_go'
                    },{
                        contentEl: 'sidebar_gongzuobeiwang',
                        title:'工作备忘',
                        border:false,
                        iconCls:'foler_wrench'
                    },{
                        contentEl: 'sidebar_xuncharizhi',
                        title:'巡查日志',
                        border:false,
                        iconCls:'foler_wrench'
                    }
                  ]
                },
                    
            
            {
                region:'north',
                id:'north-panel',
                title:'市场信息管理系统',
                //split: true,
                height:130,
                minSize: 0,
                //maxSize: 50,
                collapsible: true,
                margins:'0 5 0 5',
                cmargins:'35 5 5 5',
                layout:'column',
                contentEl:'header'
              
             
            }
            ,
            {
                region:'center',
                margins:'0 5 5 0',
                layout:'column',
                autoScroll:true,
                contentEl:'content'
                 
            }]
        });
    });"
    javascript_tag(function)
  end
  
  def extLayoutInnerFrom (title)
     function =  "Ext.onReady(function(){
       Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
       var viewport = new Ext.Viewport(
       {
            layout:'border',
            items:[


            {
                    region:'west',
                    id:'west-panel',
                    
                    title:'功能菜单',
                    split:true,
                    width: 118,
                    minSize: 175,
                    maxSize: 400,
                    collapsible: true,
                    margins:'0 0 0 5',
                    layout:'accordion',
                    layoutConfig:{
                        animate:true
                    },
                    items: [{
                        contentEl: 'sidebar_shangpinbeian',
                        title:'商品备案',
                        border:false,
                        iconCls:'folder_go'
                    },{
                        contentEl: 'sidebar_gongzuobeiwang',
                        title:'工作备忘',
                        border:false,
                        iconCls:'foler_wrench'
                    },{
                        contentEl: 'sidebar_xuncharizhi',
                        title:'巡查日志',
                        border:false,
                        iconCls:'foler_wrench'
                    }
                  ]
                },
            {
                region:'north',
                id:'north-panel',
                title:'市场信息管理系统',
                split: true,
                height:130,
                minSize: 10,
                maxSize: 50,
                collapsible: true,
                margins:'0 5 0 5',
                cmargins:'35 5 5 5',
                layout:'column',
                contentEl:'header'
           }
            ,
           {
                region:'center',
                margins:'5 5 5 0',
                layout:'column',
                autoScroll:true,
                items:[{
                    columnWidth:.99,
                    baseCls:'x-plain',
                    bodyStyle:'padding:0px 0px 5px 0px',
                    items:[{
                        title: '#{title}',
                          contentEl:'content'
                    }]
                }]
            }]
        });
    });"
    javascript_tag(function)
  end
  
  def ext_layout_tabpanel(tabitems)
    function = " Ext.onReady(function(){


       Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

       var viewport = new Ext.Viewport({
            layout:'border',
            items:[{
             //   region:'west',
             //   id:'west-panel',
             //   title:'功能菜单',
             //   split:true,
            //    width: 118,
             //   minSize: 175,
              //  maxSize: 400,
              //  collapsible: true,
             //   margins:'0 0 5 5',
             //   cmargins:'35 5 5 5',
             //   layout:'column',
            //    contentEl:'sidebar'
              
             
            //},
            
                    region:'west',
                    id:'west-panel',
                    title:'功能菜单',
                    split:true,
                    width: 118,
                    minSize: 175,
                    maxSize: 400,
                    collapsible: true,
                    margins:'0 0 0 5',
                    layout:'accordion',
                    layoutConfig:{
                        animate:true
                    },
                    items: [{
                        contentEl: 'sidebar_shangpinbeian',
                        title:'商品备案',
                        border:false,
                        iconCls:'folder_go'
                    },{
                        contentEl: 'sidebar_gongzuobeiwang',
                        title:'工作备忘',
                        border:false,
                        iconCls:'foler_wrench'
                    },{
                        contentEl: 'sidebar_xuncharizhi',
                        title:'巡查日志',
                        border:false,
                        iconCls:'foler_wrench'
                    }
                  ]
                },
            
            {
                region:'north',
                id:'north-panel',
                title:'市场信息管理系统',
                //split: true,
                height:130,
                minSize: 0,
                //maxSize: 50,
                collapsible: true,
                margins:'0 5 0 5',
                cmargins:'35 5 5 5',
                layout:'column',
                contentEl:'header'
              
             
            }
            ,
            new Ext.TabPanel({
                    region:'center',
                    margins:'0 5 0 0',
                    deferredRender:false,
                    activeTab:0,
                    items:[#{tabitems}]
                })]
        });
    });"
    javascript_tag(function)
    
  end
 
  def ext_grid (model,primary_key,weizhi,fields,columns,hangshu,width,height,preview,zhongwenming)
    # xml_fields = fields
     #xml_fields << primary_key
     #xml_fields.collect! {|x| "'#{x}'"}
    function = "Ext.onReady(function(){

    //新建对话框的信号变量
    var dialog;
    //create the Data Store
    var store = new Ext.data.JsonStore({
        //reader:new Ext.data.JsonReader({
        root: '#{model.pluralize}',
        totalProperty: 'totalCount',
        
        id: '#{primary_key}',
       // 远程排序选项-----
        remoteSort: false,
        fields: 
          [#{fields}]
        ,

        // load using script tags for cross domain, if the data in on the same domain as
        // this page, an HttpProxy would be better
        //一定要设置成get提交方式，否则会根据rest原则请求到create action上
        proxy: new Ext.data.HttpProxy({method:'GET',url: '#{model.pluralize}.json' })
    });
    //store.setDefaultSort('Name', 'desc');
    


    // pluggable renders
    var pagingBar = new Ext.PagingToolbar({
        pageSize: #{hangshu},
        store: store,
        displayInfo: true,
        displayMsg: '当前显示数据： {0} - {1} of {2}',
        emptyMsg: '查询无结果',  
        items:[
            '-', {
             //浏览按钮
            pressed: true,
            enableToggle:true,
            text: '显示预览',
            cls: 'x-btn-text-icon details',
            toggleHandler: function(btn, pressed){
                var view = grid.getView();
                view.showPreview = pressed;
                view.refresh();
            }
        }]
    });

    var grid = new Ext.grid.GridPanel({
        el: '#{weizhi}',
        width:#{width},
        height:#{height},
        title:'#{zhongwenming}',
        store: store,
        trackMouseOver:true,
         //是否能选择某行
        disableSelection:false,
        loadMask: true,
         
        // grid columns
        columns:[#{columns}],
        

        // customize view config
        viewConfig: {
            forceFit:true,
            enableRowBody:true,
             //默认是否显示预览
            showPreview:false,
            getRowClass : function(record, rowIndex, p, store){
                if(this.showPreview){
                    p.body = '<p>'+record.data.#{preview}+'</p>';
                    return 'x-grid3-row-expanded';
                }
                return 'x-grid3-row-collapsed';
            }
        },
        tbar:[{
                      text: '搜索#{zhongwenming}:'
                    },{
                      xtype: 'textfield',
                      id: 'filter',
                      selectOnFocus: true,
                      width: 100,
                      listeners: {
                        'render': {fn:function(){
                  Ext.getCmp('filter').getEl().on('keyup', function(){
                     filter();
                  }, this, {buffer:500});
                        }, scope:this}
                      }
                   } ,'-',{
            text:'新增#{zhongwenming} ',
            tooltip:'新增一条信息',
            iconCls:'add',
            handler:createResource
        }, '-', {
            text:'删除#{zhongwenming}',
            tooltip:'删除一条信息',
            iconCls:'remove',
            handler:deleteResource
        },'-', {
            text:'查看#{zhongwenming}',
            tooltip:'查看一条信息',
            iconCls:'view',
            handler:editResource
        }],
        
 
        // paging bar on the bottom
        bbar: pagingBar
    });
    // render it
    grid.render();
    // trigger the data store load
    store.load({params:{start:0, limit:'#{hangshu}'}});
    //双击表格行事件
    grid.on('rowdblclick',editResource);
  
   //删除钮触发方法，其中调用了postDelete方法进一步操作，该方面在下面有定义
  function deleteResource(){
    var id= grid.getSelectionModel().getSelected();
    if(id){
      var news =id.get('#{primary_key}');
      Ext.MessageBox.confirm('确认','你确定要删除这项 #{zhongwenming} 吗?',postDelete);
      
    }
    else{
      Ext.MessageBox.alert('请选择要删除的项！')
    }
  }
  

  
  function postDelete(btn){
    if(btn =='yes'){
      var id = grid.getSelectionModel().getSelected();
      var deleteme = id.get( '#{primary_key}');
      window.location.href = '/#{model.pluralize}/destroy/'+ deleteme;
    }
  }
  
  function createResource(){
      window.location.href = '#{model.pluralize}/new';
  }

   function editResource(){
      var id =grid.getSelectionModel().getSelected();
      if(id){
        window.location.href = '#{model.pluralize}/' + id.get('#{primary_key}') + '/edit';
      }
    }
    
   function filter(){
    var filter = Ext.get('filter').dom.value;
    store.proxy = new Ext.data.HttpProxy({method: 'GET',url: '#{model.pluralize}.json?search=' + filter});
    store.reload();
    //grid.store.filter('Name', filter.getValue());
    //grid.select(0);
  } 
});
  /**
 * @class Ext.ux.SliderTip
 * @extends Ext.Tip
 * Simple plugin for using an Ext.Tip with a slider to show the slider value
 */
Ext.ux.SliderTip = Ext.extend(Ext.Tip, {
    minWidth: 10,
    offsets : [0, -10],
    init : function(slider){
        slider.on('dragstart', this.onSlide, this);
        slider.on('drag', this.onSlide, this);
        slider.on('dragend', this.hide, this);
        slider.on('destroy', this.destroy, this);
    },

    onSlide : function(slider){
        this.show();
        this.body.update(this.getText(slider));
        this.doAutoWidth();
        this.el.alignTo(slider.thumb, 'b-t?', this.offsets);
    },

    getText : function(slider){
        return slider.getValue();
    }
});"
    javascript_tag(function)
  end
  
  
  
  
  
  
  def ext_layoutdialog(title)
     function = "Ext.onReady(function() {
    var window = new Ext.Window({
        title: '#{title}',
        width: 500,
        height:350,
       // minWidth: 300,
       // minHeight: 200,
        layout: 'fit',
        plain:true,
        bodyStyle:'padding:5px;',
        buttonAlign:'center',
        contentEl:'content',
         autoScroll:true
    });

    window.show();
});"
    javascript_tag(function)
  end
  
  #
  def ext_layoutTabPanel(inbiaoqian,tabfields)
     function = "Ext.onReady(function() {
      var tabpanel = new Ext.TabPanel({
                         id:'iou',
                       height:420,
                           width:1207,
                    deferredRender:false,
                    activeTab:0,
                      el: '#{inbiaoqian}',
                    items:[#{tabfields}]
                });
                tabpanel.render();       
               });"
      javascript_tag(function)
  end
  
  def extTabAndPanellayout(xinxiBiaoqian,tabPanelBiaoqian,name)
    function = " Ext.onReady(function(){


       Ext.state.Manager.setProvider(new Ext.state.CookieProvider());

       var viewport = new Ext.Viewport({
            layout:'border',
            items:[{
                region:'west',
                id:'west-panel',
                title:'Navigation',
                split:true,
                width: 125,
                minSize: 175,
                maxSize: 400,
                collapsible: true,
                margins:'0 0 0 5',
                cmargins:'35 5 5 5',
                layout:'column',
                contentEl:'sidebar'
              
             
            },
            {
                region:'north',
                id:'north-panel',
                title:'Header',
                //split: true,
                //height:100,
                minSize: 0,
                //maxSize: 50,
                collapsible: true,
                margins:'0 5 0 5',
                cmargins:'35 5 5 5',
                layout:'column',
                contentEl:'header'
            }
            ,
            {
                region:'center',
                margins:'0 5 5 0',
                layout:'column',
                autoScroll:true,
                 
                 items: grid
                  },{
                    //title: '',
                    region: 'south',
                    height: 420,
                    contentEl: '#{tabPanelBiaoqian}'
                    
                  }
                    
                  ]
                })
                 
            }]
        });
    });"
    javascript_tag(function)
  end
  
  
  
  def shangjia_ext_grid (model,primary_key,weizhi,fields,columns,hangshu,width,height,preview,zhongwenming)
    # xml_fields = fields
     #xml_fields << primary_key
     #xml_fields.collect! {|x| "'#{x}'"}
    function = "Ext.onReady(function(){

    //新建对话框的信号变量
    var dialog;
    //create the Data Store
    var store = new Ext.data.JsonStore({
        //reader:new Ext.data.JsonReader({
        root: '#{model.pluralize}',
        totalProperty: 'totalCount',
        
        id: '#{primary_key}',
       // 远程排序选项-----
        remoteSort: false,
        fields: 
          [#{fields}]
        ,

        // load using script tags for cross domain, if the data in on the same domain as
        // this page, an HttpProxy would be better
        //一定要设置成get提交方式，否则会根据rest原则请求到create action上
        proxy: new Ext.data.HttpProxy({method:'GET',url: '#{model.pluralize}.json' })
    });
    //store.setDefaultSort('Name', 'desc');
    


    // pluggable renders
    var pagingBar = new Ext.PagingToolbar({
        pageSize: #{hangshu},
        store: store,
        displayInfo: true,
        displayMsg: '当前显示数据： {0} - {1} of {2}',
        emptyMsg: '查询无结果',  
        items:[
            '-', {
             //浏览按钮
            pressed: true,
            enableToggle:true,
            text: '显示预览',
            cls: 'x-btn-text-icon details',
            toggleHandler: function(btn, pressed){
                var view = grid.getView();
                view.showPreview = pressed;
                view.refresh();
            }
        }]
    });

    var grid = new Ext.grid.GridPanel({
        el: '#{weizhi}',
        width:#{width},
        height:#{height},
        title:'#{zhongwenming}',
        store: store,
        trackMouseOver:true,
         //是否能选择某行
        disableSelection:false,
        loadMask: true,
         
        // grid columns
        columns:[#{columns}],
        

        // customize view config
        viewConfig: {
            forceFit:true,
            enableRowBody:true,
             //默认是否显示预览
            showPreview:false,
            getRowClass : function(record, rowIndex, p, store){
                if(this.showPreview){
                    p.body = '<p>'+record.data.#{preview}+'</p>';
                    return 'x-grid3-row-expanded';
                }
                return 'x-grid3-row-collapsed';
            }
        },
        tbar:[{
                      text: '名称搜索:'
                    },{
                      xtype: 'textfield',
                      id: 'filter1',
                      selectOnFocus: true,
                      width: 100,
                      listeners: {
                        'render': {fn:function(){
                  Ext.getCmp('filter1').getEl().on('keyup', function(){
                     filter1();
                  }, this, {buffer:500});
                        }, scope:this}
                      }
                   }, 
                   
                   
                   
                   
                   {
                      text: '地址搜索:'
                    },{
                      xtype: 'textfield',
                      id: 'filter3',
                      selectOnFocus: true,
                      width: 100,
                      listeners: {
                        'render': {fn:function(){
                  Ext.getCmp('filter3').getEl().on('keyup', function(){
                     filter3();
                  }, this, {buffer:500});
                        }, scope:this}
                      }
                   },
                   
                   {
                      text: '品类搜索:'
                    },{
                      xtype: 'textfield',
                      id: 'filter4',
                      selectOnFocus: true,
                      width: 100,
                      listeners: {
                        'render': {fn:function(){
                  Ext.getCmp('filter4').getEl().on('keyup', function(){
                     filter4();
                  }, this, {buffer:500});
                        }, scope:this}
                      }
                   }
                   
                   
                   ,'-',{
            text:'新增#{zhongwenming} ',
            tooltip:'新增一条信息',
            iconCls:'add',
            handler:createResource
        }, '-', {
            text:'删除#{zhongwenming}',
            tooltip:'删除一条信息',
            iconCls:'remove',
            handler:deleteResource
        },'-', {
            text:'查看#{zhongwenming}',
            tooltip:'查看一条信息',
            iconCls:'view',
            handler:editResource
        }],
        
 
        // paging bar on the bottom
        bbar: pagingBar
    });
    // render it
    grid.render();
    // trigger the data store load
    store.load({params:{start:0, limit:'#{hangshu}'}});
    //双击表格行事件
    grid.on('rowdblclick',editResource);
  
   //删除钮触发方法，其中调用了postDelete方法进一步操作，该方面在下面有定义
  function deleteResource(){
    var id= grid.getSelectionModel().getSelected();
    if(id){
      var news =id.get('#{primary_key}');
      Ext.MessageBox.confirm('确认','你确定要删除这项 #{zhongwenming} 吗?',postDelete);
      
    }
    else{
      Ext.MessageBox.alert('请选择要删除的项！')
    }
  }
  

  
  function postDelete(btn){
    if(btn =='yes'){
      var id = grid.getSelectionModel().getSelected();
      var deleteme = id.get( '#{primary_key}');
      window.location.href = '/#{model.pluralize}/destroy/'+ deleteme;
    }
  }
  
  function createResource(){
      window.location.href = '#{model.pluralize}/new';
  }

   function editResource(){
      var id =grid.getSelectionModel().getSelected();
      if(id){
        window.location.href = '#{model.pluralize}/' + id.get('#{primary_key}') + '/edit';
      }
    }
    
   function filter1(){
    var filter = Ext.get('filter1').dom.value;
    store.proxy = new Ext.data.HttpProxy({method: 'GET',url: '#{model.pluralize}.json?searchshangjia=' + filter});
    store.reload();
    //grid.store.filter('Name', filter.getValue());
    //grid.select(0);
  }  

   function filter3(){
    var filter = Ext.get('filter3').dom.value;
    store.proxy = new Ext.data.HttpProxy({method: 'GET',url: '#{model.pluralize}.json?searchdizhi=' + filter});
    store.reload();
    //grid.store.filter('Name', filter.getValue());
    //grid.select(0);
  }
   function filter4(){
    var filter = Ext.get('filter4').dom.value;
    store.proxy = new Ext.data.HttpProxy({method: 'GET',url: '#{model.pluralize}.json?searchleixing=' + filter});
    store.reload();
    //grid.store.filter('Name', filter.getValue());
    //grid.select(0);
  }
});
  /**
 * @class Ext.ux.SliderTip
 * @extends Ext.Tip
 * Simple plugin for using an Ext.Tip with a slider to show the slider value
 */
Ext.ux.SliderTip = Ext.extend(Ext.Tip, {
    minWidth: 10,
    offsets : [0, -10],
    init : function(slider){
        slider.on('dragstart', this.onSlide, this);
        slider.on('drag', this.onSlide, this);
        slider.on('dragend', this.hide, this);
        slider.on('destroy', this.destroy, this);
    },

    onSlide : function(slider){
        this.show();
        this.body.update(this.getText(slider));
        this.doAutoWidth();
        this.el.alignTo(slider.thumb, 'b-t?', this.offsets);
    },

    getText : function(slider){
        return slider.getValue();
    }
});"
    javascript_tag(function)
  end
  
  
  
  def ext_edit_grid(title,model,primary_key,weizhi,pagesize,checkcolumnname,checkcolumnindex,neirong,plant,fields,columns,newplant,newplantshujucaozuo)
    function = "Ext.onReady(function(){
    Ext.QuickTips.init();

    function formatDate(value){
        return value ? value.dateFormat('M d, Y') : '';
    };
    // shorthand alias
    var fm = Ext.form;

    // custom column plugin example
    var checkColumn = new Ext.grid.CheckColumn({
       header: '#{checkcolumnname}',
       dataIndex: '#{checkcolumnindex}',
       width: 55
    });


    // the column model has information about grid columns
    // dataIndex maps the column to the specific data field in
    // the data store (created below)
    var cm = new Ext.grid.ColumnModel([#{columns}]);

    // by default columns are sortable
    cm.defaultSortable = true;

  
    // this could be inline, but we want to define the Plant record
    // type so we can add records dynamically
    var Plant = Ext.data.Record.create([#{plant}]);

    // create the Data Store
        var store = new Ext.data.JsonStore({
        //reader:new Ext.data.JsonReader({
        root: '#{model.pluralize}',
        totalProperty: 'totalCount',
        record: '#{model}',
        id: '#{primary_key}',
       // 远程排序选项-----
        remoteSort: false,
        fields: [#{fields}],

        // load using script tags for cross domain, if the data in on the same domain as
        // this page, an HttpProxy would be better
        //一定要设置成get提交方式，否则会根据rest原则请求到create action上
        proxy: new Ext.data.HttpProxy({method:'GET',url: '/#{model.pluralize}.json' })
    });


    // pluggable renders
    var pagingBar = new Ext.PagingToolbar({
        pageSize: #{pagesize},
        store: store,
        displayInfo: true,
        displayMsg: '当前显示数据： {0} - {1} of {2}',
        emptyMsg: '查询无结果',  
        items:[
            '-', {
             //浏览按钮
            pressed: true,
            enableToggle:true,
            text: '显示预览',
            cls: 'x-btn-text-icon details',
            toggleHandler: function(btn, pressed){
                var view = grid.getView();
                view.showPreview = pressed;
                view.refresh();
            }
        }]
    });
    
    
    // create the editor grid
    var grid = new Ext.grid.EditorGridPanel({
        store: store,
        cm: cm,
        renderTo: '#{weizhi}',
        width:1200,
        height:400,
        autoExpandColumn:'autoExpandColumn',
        title:'#{title}',
        frame:true,
        trackMouseOver:true,
        plugins:checkColumn,
        clicksToEdit:2,
        disableSelection:false,
        //modal:true,
        //只能选择一行
        sm: new Ext.grid.RowSelectionModel({singleSelect: true}),
       listeners: {
  afteredit: function(e){
    var conn = new Ext.data.Connection();
    
    
    //乱办法套的
    if (e.record.data.id != null)
      ids = e.record.data.id
    else
      ids = e.record.id
      
      
    conn.request({
      method: 'GET',
      url: 'updatel.json',
      params: {
        action: 'updatel',
        id: ids,
        field: e.field,
        value: e.value,
      
      },
      success: function(resp,opt) {
        //e.record.commit();
      },
      failure: function(resp,opt) {
        //e.record.reject();
      }
    });
  }
},

        tbar: [{
            text: '增加#{neirong}',
            icon: 'images/table_add.png',
            cls: 'x-btn-text-icon',
            handler: function() {
            var conn = new Ext.data.Connection();
            conn.request({
                  method:'GET',
                  url: 'createl.json',
                  params: {
                    action: 'createl',
                      #{newplantshujucaozuo}
                              },
                  success: function(resp,opt) {
                  var insert_id = Ext.util.JSON.decode(resp.responseText).insert_id;
                  grid.getStore().insert(0,
                    new Plant({#{newplant}})
                    );
                  grid.stopEditing();
                  grid.startEditing(0,0);
                    },
                 failure: function(resp,opt) {
                    Ext.Msg.alert('错误','无法添加数据');
                    }
                   });
             }     
        },
        
        {
       text: '删除#{neirong}',
       icon: 'images/table_delete.png',
       cls: 'x-btn-text-icon',
       handler: function() {
       var sm = grid.getSelectionModel();
       var sel = sm.getSelected();
       
       
       //乱办法套的
       if (sel.data.id != null)
         ids = sel.data.id
       else
         ids = sel.id
      
      
       if (sm.hasSelection()){
          Ext.Msg.show({
          title: '删除#{neirong}',
          buttons: Ext.MessageBox.YESNOCANCEL,
          msg: '删除'+sel.data.name+'?',
          fn: function(btn){
            if (btn == 'yes'){
                var conn = new Ext.data.Connection();
                conn.request({
                   method:'GET',
                   url: 'deletel.json',
                   params: {
                     action: 'deletel',
                     id: ids
                      },
                success: function(resp,opt) {
                grid.getStore().remove(sel);
                   },
                failure: function(resp,opt) {
                Ext.Msg.alert('错误','无法删除数据');
                   }
                  });
                  }
               }
               });
             }
           else{  
                    Ext.Msg.alert('错误','请先选择删除的行，谢谢');  
             } ;
           }
}],

// paging bar on the bottom
        bbar: pagingBar
    });

    // trigger the data store load
    store.load();
});

Ext.grid.CheckColumn = function(config){
    Ext.apply(this, config);
    if(!this.id){
        this.id = Ext.id();
    }
    this.renderer = this.renderer.createDelegate(this);
};

Ext.grid.CheckColumn.prototype ={
    init : function(grid){
        this.grid = grid;
        this.grid.on('render', function(){
            var view = this.grid.getView();
            view.mainBody.on('mousedown', this.onMouseDown, this);
        }, this);
    },

    onMouseDown : function(e, t){
        if(t.className && t.className.indexOf('x-grid3-cc-'+this.id) != -1){
            e.stopEvent();
            var index = this.grid.getView().findRowIndex(t);
            var record = this.grid.store.getAt(index);
            record.set(this.dataIndex, !record.data[this.dataIndex]);
        }
    },

    renderer : function(v, p, record){
        p.css += ' x-grid3-check-col-td'; 
        return '<div class=\"x-grid3-check-col'+(v?'-on':'')+' x-grid3-cc-'+this.id+'\">&#160;</div>';
    }
};
    
    
    "
     javascript_tag(function)
  end

  
#与  ext_edit_grid的区别只在：更新,加减行，响应url的定义上
  def ext_edit_grid_iest(title,model,primary_key,weizhi,pagesize,neirong,plant,fields,preview,columns,newplant,newplantshujucaozuo,checkcolumns,url,plugins,updatel,createl,deletel)
    function = "Ext.onReady(function(){
    Ext.QuickTips.init();

    function formatDate(value){
        return value ? value.dateFormat('M d, Y') : '';
    };
    // shorthand alias
    var fm = Ext.form;

    // custom column plugin example
    #{checkcolumns};


    // the column model has information about grid columns
    // dataIndex maps the column to the specific data field in
    // the data store (created below)
    var cm = new Ext.grid.ColumnModel([#{columns}]);

    // by default columns are sortable
    cm.defaultSortable = true;

  
    // this could be inline, but we want to define the Plant record
    // type so we can add records dynamically
    var Plant = Ext.data.Record.create([#{plant}]);

    // create the Data Store
        var store = new Ext.data.JsonStore({
        //reader:new Ext.data.JsonReader({
        root: '#{model.pluralize}',
        totalProperty: 'totalCount',
        record: '#{model}',
        id: '#{primary_key}',
       // 远程排序选项-----
        remoteSort: false,
        fields: [#{fields}],

        // load using script tags for cross domain, if the data in on the same domain as
        // this page, an HttpProxy would be better
        //一定要设置成get提交方式，否则会根据rest原则请求到create action上
        proxy: new Ext.data.HttpProxy({method:'GET',url: '#{url}' })
    });


    // pluggable renders
    var pagingBar = new Ext.PagingToolbar({
        pageSize: #{pagesize},
        store: store,
        displayInfo: true,
        displayMsg: '当前显示数据： {0} - {1} of {2}',
        emptyMsg: '查询无结果',  
        items:[
            '-', {
             //浏览按钮
            pressed: true,
            enableToggle:true,
            text: '显示预览',
            cls: 'x-btn-text-icon details',
            toggleHandler: function(btn, pressed){
                var view = grid.getView();
                view.showPreview = pressed;
                view.refresh();
            }
        }]
    });
    
    
    // create the editor grid
    var grid = new Ext.grid.EditorGridPanel({
        store: store,
        cm: cm,
        renderTo: '#{weizhi}',
        width:1200,
        height:400,
        autoExpandColumn:'autoExpandColumn',
        title:'#{title}',
        frame:true,
        trackMouseOver:true,
        plugins:[#{plugins}],
        fireafteredit : true,
         //只能选择一行
        sm: new Ext.grid.RowSelectionModel({singleSelect: true}),
        clicksToEdit:2,
        disableSelection:false,
        //modal:false,
        
                // customize view config
        viewConfig: {
            forceFit:true,
            enableRowBody:true,
             //默认是否显示预览
            showPreview:false,
            getRowClass : function(record, rowIndex, p, store){
                if(this.showPreview){
                    p.body = '<p>'+record.data.#{preview}+'</p>';
                    return 'x-grid3-row-expanded';
                }
                return 'x-grid3-row-collapsed';
            }
        },
       
       listeners: {
  afteredit: function(e){
    var conn = new Ext.data.Connection();
    
    
    //乱办法套的
    if (e.record.data.id != null)
      ids = e.record.data.id
    else
      ids = e.record.id
      
      
    conn.request({
      method: 'GET',
      url: '#{updatel}',
      params: {
        action: 'updatel',
        id: ids,
        field: e.field,
        value: e.value,
      
      },
      success: function(resp,opt) {
                    
        //e.record.commit();
      },
      failure: function(resp,opt) {
        //e.record.reject();
      }
    });
  }
},

        tbar: [{
            text: '增加#{neirong}',
            icon: 'images/table_add.png',
            cls: 'x-btn-text-icon',
            handler: function() {
            var conn = new Ext.data.Connection();
            conn.request({
                  method:'GET',
                  url: '#{createl}',
                  params: {
                    action: 'createl',
                      #{newplantshujucaozuo}
                              },
                  success: function(resp,opt) {
                  var insert_id = Ext.util.JSON.decode(resp.responseText).insert_id;
                  grid.getStore().insert(0,
                    new Plant({#{newplant}})
                    );
                  grid.stopEditing();
                  grid.startEditing(0,0);
                    },
                 failure: function(resp,opt) {
                    Ext.Msg.alert('错误','无法添加数据');
                    }
                   });
             }     
        },
        
        {
       text: '删除#{neirong}',
       icon: 'images/table_delete.png',
       cls: 'x-btn-text-icon',
       handler: function() {
       var sm = grid.getSelectionModel();
       var sel = sm.getSelected();
       
       
       //乱办法套的
       if (sel.data.id != null)
         ids = sel.data.id
       else
         ids = sel.id
      
      
       if (sm.hasSelection()){
          Ext.Msg.show({
          title: '删除#{neirong}',
          buttons: Ext.MessageBox.YESNOCANCEL,
          msg: '删除'+sel.data.faqishijian+sel.data.shanghu+'#{title}'+'?',
          fn: function(btn){
            if (btn == 'yes'){
                var conn = new Ext.data.Connection();
                conn.request({
                   method:'GET',
                   url: '#{deletel}',
                   params: {
                     action: 'deletel',
                     id: ids
                      },
                success: function(resp,opt) {
                grid.getStore().remove(sel);
                   },
                failure: function(resp,opt) {
                Ext.Msg.alert('错误','无法删除数据');
                   }
                  });
                  }
               }
               });
             }
           else{  
                    Ext.Msg.alert('错误','请先选择删除的行，谢谢');  
             } ;
           }
}],

// paging bar on the bottom
        bbar: pagingBar
    });

    // trigger the data store load
    store.load();
});

   

Ext.grid.CheckColumn = function(config){
    Ext.apply(this, config);
    if(!this.id){
        this.id = Ext.id();
    }
    this.renderer = this.renderer.createDelegate(this);
};

Ext.grid.CheckColumn.prototype ={
    init : function(grid){
        this.grid = grid;
        this.grid.on('render', function(){
            var view = this.grid.getView();
            view.mainBody.on('mousedown', this.onMouseDown, this);
        }, this);
    },

    onMouseDown : function(e, t){
        if(t.className && t.className.indexOf('x-grid3-cc-'+this.id) != -1){
            e.stopEvent();
            var index = this.grid.getView().findRowIndex(t);//行号  
            var cindex = this.grid.getView().findCellIndex(t);//列好  
            var record = this.grid.store.getAt(index);//行记录  
            var field = this.grid.colModel.getDataIndex(cindex);//列名  
            var value = !record.data[this.dataIndex];//点击后，获得当前checkbox值的相反值  
            record.set(this.dataIndex, value);//设定checkbox被选择时候的值  
            //事件的参数  
            var e = {  
               grid: this.grid,  
               record: record,  
               field: field,   
               originalValue: record.data[this.dataIndex],  
               value: record.data[this.dataIndex],  
               row: index,  
               column: cindex  
           };  
  
    
           this.grid.fireEvent(\"afteredit\", e);
        }
    },

    renderer : function(v, p, record){
        p.css += ' x-grid3-check-col-td'; 
        return '<div class=\"x-grid3-check-col'+(v?'-on':'')+' x-grid3-cc-'+this.id+'\">&#160;</div>';
    }
};
    

    
    "
     javascript_tag(function)
  end



  
  
  def baozhuangleixing f
    html = ''
    html << "#{f.select :leixing,{'箱装'=>'箱装','散装' =>'散装','袋装' =>'袋装','礼盒装' =>'礼盒装','其他'=>'其他'}}"
  end
  
  def pinlei f
    html = ''
    html << "#{f.select :leixing,{'鸡付'=>'鸡付','鸭付' =>'鸭付','水产' =>'水产','猪付' =>'猪付','牛付' =>'牛付','羊付' =>'羊付','半成品' =>'半成品','其他'=>'其他'}}"
    
  end
  
  def xuncharizhidalei
    html = ''
    html << "<option value='商品备案'>商品备案</option><option value='参观登记'>参观登记</option><option value='备忘'>备忘</option><option value='设备报修'>设备报修</option>"
    
  end
  
  
  
end
