classdef AffPt < CfgBase 
    properties(Access=private,Static)
        uname = 'AffPt';        
    end
    
    properties(Access = public)
        threshold = 8/3;
        max_iter = 16;
        double_image = 0;
        initial_sigma = 1.6;
        octave_scales = 3;
        scale = 1.0;
        estimate_angle = 1;
        compute_descriptor = 0;
        output_format = 2;
    end

    methods
        function this = AffPt(varargin)
            this = this@CfgBase(varargin{:});
            if ~isempty(varargin)
                this = helpers.vl_argparse(this,varargin{:});
            end
        end
    end
    
    methods(Static)
        function uname = get_uname()
            uname = COVDET.CFG.uname;
        end
    end
end 