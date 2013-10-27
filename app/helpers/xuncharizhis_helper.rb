# encoding: utf-8
module XuncharizhisHelper
  
  def xuncharizhi_ext_edit_grid_iest(title,model,primary_key,weizhi,pagesize,neirong,plant,fields,preview,columns,newplant,newplantshujucaozuo,checkcolumns,url,plugins,updatel,createl,deletel)
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
           
          if (e.field == 'tanweihao'){           
          var zihao = Ext.util.JSON.decode(resp.responseText).zihao;
             e.record.set('zihao', zihao);
                  }
                    
        //e.record.commit();
      },
      failure: function(resp,opt) {
        //e.record.reject();
      }
    });
  }
},

        tbar: [ 
          {
            text: '增加#{neirong}',
            iconCls:'add',
            //cls: 'x-btn-text-icon',
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
       iconCls:'remove',
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
          
                   
                   
                   
}
 ,'-',
           
           {
                text: '商户搜索:'
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
                      text: '字号搜索:'
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
                      text: '问题搜索:'
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

],

// paging bar on the bottom
        bbar: pagingBar
    });

    // trigger the data store load
    store.load();
    
    function filter1(){
    var filter = Ext.get('filter1').dom.value;
    store.proxy = new Ext.data.HttpProxy({method: 'GET',url: '#{model.pluralize}.json?searchtanweihao=' + filter});
    store.reload();
    //grid.store.filter('Name', filter.getValue());
    //grid.select(0);
  }  

   function filter3(){
    var filter = Ext.get('filter3').dom.value;
    store.proxy = new Ext.data.HttpProxy({method: 'GET',url: '#{model.pluralize}.json?searchzihao=' + filter});
    store.reload();
    //grid.store.filter('Name', filter.getValue());
    //grid.select(0);
  }
   function filter4(){
    var filter = Ext.get('filter4').dom.value;
    store.proxy = new Ext.data.HttpProxy({method: 'GET',url: '#{model.pluralize}.json?searchwenti=' + filter});
    store.reload();
    //grid.store.filter('Name', filter.getValue());
    //grid.select(0);
  }
   

    
    
    
    
    
    
    
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
end
