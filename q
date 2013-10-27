
[1mFrom:[0m /home/edison/Aptana Studio 3 Workspace/hzlcgs/app/controllers/shipinanquan_controller.rb @ line 36 ShipinanquanController#sp:

    [1;34m28[0m: [1;31mdef[0m [1;34msp[0m
    [1;34m29[0m:   @shangpin = [1;34m[4mShangpin[0m.new
    [1;34m30[0m:   @shanghu = [1;34m[4mShanghu[0m.find(params[[1;32m:shanghu_id[0m])
    [1;34m31[0m:   code = [32m[1;32m"[0m[32m[1;32m"[0m[32m[0m
    [1;34m32[0m:   code << [32m[1;32m"[0m[32mif @shanghu != nil ;[1;32m"[0m[32m[0m
    [1;34m33[0m:   code << [32m[1;32m"[0m[32m@sa =#{params[[1;32m:lei[0m].capitalize}[0m[32m.find(#{params[[1;32m:shangjia_id[0m]}[0m[32m);[1;32m"[0m[32m[0m
    [1;34m34[0m:   code << [32m[1;32m"[0m[32mend[1;36m\n[0m[32m[1;32m"[0m[32m[0m
    [1;34m35[0m:   code << [32m[1;32m"[0m[32m@sa[1;32m"[0m[32m[0m
 => [1;34m36[0m:   binding.pry
    [1;34m37[0m:   @shangjia = class_eval code
    [1;34m38[0m:   [0;34m#厂家商户 已备案的商品[0m
    [1;34m39[0m:   @sps = @shanghu.shangpins
    [1;34m40[0m:   [0;34m#"#@shanghu.shangpins.find(:all, :conditions => ['#{params[:lei]}_id = ?',#{params[:shangjia_id]}])"[0m
    [1;34m41[0m:   [0;34m#@shangpins = class_eval code2[0m
    [1;34m42[0m:   [0;34m#@sps = @shanghu.shangpins[0m
    [1;34m43[0m: 
    [1;34m44[0m:   code2 = [32m[1;32m"[0m[32m[1;32m"[0m[32m[0m
    [1;34m45[0m:   @sss = [32m[1;32m%w{[0m[32m[1;32m}[0m[32m[0m
    [1;34m46[0m:   code2 [32m[1;32m<<"@sps"[0m[32m[0m
    [1;34m47[0m:   @shangpins = class_eval code2
    [1;34m48[0m:   
    [1;34m49[0m:   
    [1;34m50[0m: [1;31mend[0m

