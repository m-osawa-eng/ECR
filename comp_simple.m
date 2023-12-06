function [comp_out] = comp_simple(comp_in, comp_value, disp)
% comp_in - input audio
% comp_value - compression 0 < comp_value <= 1
% disp - if 1, display input/output curve.
% comp_out - output audio
    
    comp_out = abs(comp_in).^comp_value;
    comp_out(comp_in<0) = -comp_out(comp_in<0);
    
    if disp==1
        x = 0:0.01:1;
        y = x.^comp_value;
        figure()
        plot(x, y)
        axis([0 1 0 1])
        grid on
        xlabel('Input amplitude')
        ylabel('output amplitude')
    end

end

