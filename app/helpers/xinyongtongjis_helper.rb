# encoding: utf-8
module XinyongtongjisHelper
  def xinyongtongji_ext_grid (model,primary_key,weizhi,fields,columns,hangshu,width,height,preview,zhongwenming)
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
        emptyMsg: '查无数据',  
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
    
    
        var xinyongzhouqi_store = new Ext.data.JsonStore({
        //autoLoad : true, 
        root: 'xinyongzhouqis',
        totalProperty: 'totalCount',
        record: 'xinyongzhouqis',
        id: 'id',

        fields: ['id','name'],

  
        proxy: new Ext.data.HttpProxy({method:'GET',url: '/xinyongzhouqis.json' })
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
                      text: '摊位搜索:'
                    },{
                      xtype: 'textfield',
                      id: 'filter1',
                      selectOnFocus: true,
                      width: 60,
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
                      width: 60,
                      listeners: {
                        'render': {fn:function(){
                  Ext.getCmp('filter3').getEl().on('keyup', function(){
                     filter3();
                  }, this, {buffer:500});
                        }, scope:this}
                      }
                   },
                   
                   {
                      text: '负责人搜索:'
                    },{
                      xtype: 'textfield',
                      id: 'filter4',
                      selectOnFocus: true,
                      width: 60,
                      listeners: {
                        'render': {fn:function(){
                  Ext.getCmp('filter4').getEl().on('keyup', function(){
                     filter4();
                  }, this, {buffer:500});
                        }, scope:this}
                      }
                   }
                   
                   
                   ,'-',
                   //{
           // text:'新增#{zhongwenming} ',
            //tooltip:'新增一条信息',
           // iconCls:'add',
          //  handler:createResource
        //}, '-', {
         //   text:'删除#{zhongwenming}',
          //  tooltip:'删除一条信息',
          //  iconCls:'remove',
         //   handler:deleteResource
       // },'-', 
       {
            text:'查看#{zhongwenming}',
            tooltip:'查看一条信息',
            iconCls:'view',
            handler:editResource
        },'-',
        
        
         {
                      text: '更新统计--摊位号：'
                    },{
                      xtype: 'textfield',
                      id: 'gengxintongji_tanweihao',
                      selectOnFocus: true,
                      width: 60,
                      listeners: {
                        'render': {fn:function(){
                  Ext.getCmp('filter1').getEl().on('keyup', function(){
                     filter1();
                  }, this, {buffer:500});
                        }, scope:this}
                      }
                   },  
                   
                   
                    {
                      text: '统计周期：'
                    },
                    new Ext.form.ComboBox( {  
             
           id:'gengxintongji_xinyongzhouqi',  
           blankText : '',  
           hiddenName : 'id',  
           name : 'name',  
           triggerAction : 'all',  
           allowBlank : true,  
           editable : true,// 禁止编辑  
           //loadingText : '正在加载厂商标识',// 加载数据时显示的提示信息  
           displayField : 'name',// 定义要显示的字段  
           valueField : 'id',  
           mode : 'remote',// 远程模式  
           emptyText : '',  
           store : xinyongzhouqi_store,  
           fieldLabel : '省'
           })
           ,
                   
                   
                   
         {
            text:'更新统计',
            tooltip:'查看商品登记',
            iconCls:'beian',
            handler:viewResource
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
      Ext.MessageBox.confirm('确认','你确定要删除 #{zhongwenming}吗?',postDelete);
      
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
  
    function viewResource(){
      var tanweihao = Ext.get('gengxintongji_tanweihao').dom.value;
      var xinyongzhouqi_id = Ext.get('gengxintongji_xinyongzhouqi').dom.value;
      if (tanweihao != null){
      window.location.href = 'xinyongtongjis/gengxin?'+ 'tanweihao=' + tanweihao + '&xinyongzhouqi_id='+xinyongzhouqi_id;
       }
     // var id = grid.getSelectionModel().getSelected();
      //var deleteme = id.get( '#{primary_key}');
      //window.location.href = 'shipinanquan/sj/'+ deleteme;
  }

   function editResource(){
      var id = grid.getSelectionModel().getSelected();
      zihao = id.get('zihao');
      xinyongzhouqi_name = id.get('xinyongzhouqi');
      if(id){
        window.location.href = '/weiguijilus/chaxunfromtongji?'+ 'searchzihao=' + zihao +'&'+ 'searchxinyongzhouqiname=' + xinyongzhouqi_name;
        //window.location.href = '/weiguijilu/'+ zihao +'/'+xinyongzhouqi_name;
      }
    }
    
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
    store.proxy = new Ext.data.HttpProxy({method: 'GET',url: '#{model.pluralize}.json?searchfuzeren=' + filter});
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
end
