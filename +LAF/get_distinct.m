function [keepind,cfg] = get_distinct_affpts(cfg,affpt)
num_dr = numel(affpt);
u = LAF.affpt_to_p3x3(affpt);
drid = [affpt(:).class];

udrid = unique(drid);
rmind = false(1,num_dr);
sc = LAF.get_scale(u);
rmind(sc < cfg.min_laf_scale) = true;
for k = udrid
    ind = find(drid == k);
    lafs = u(:,ind);
    
    [idx,d] = knnsearch(lafs',lafs','K',2);
    ind1 = find(d(:,2) < 50);
    
    if(~isempty(ind1))
	    ov = LAF.calc_overlap(lafs(:,ind1), ...
	                          lafs(:,idx(ind1,2)));
	    ind2 = find(ov < cfg.ovthresh);
	    rmind(ind(idx(ind1(ind2),2))) = true;
	    rmind(ind(ind1(ind2))) = true;
	end
end
keepind1 = setdiff(1:num_dr,find(rmind));
keepind2 = find(LAF.get_angle(u) > cfg.acute);
keepind3 = find(LAF.get_angle(u) < cfg.oblique);

keepind = intersect(intersect(keepind1,keepind2),keepind3);