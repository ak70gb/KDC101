function KDC101moveto(KDC101,x,timeout_val)
KDC101.MoveTo(x, timeout_val);
pause(3);
%Check Position
pos = System.Decimal.ToDouble(KDC101.Position);
%fprintf('The motor position is %d.\n',pos);
str1 = ['Motor @ ',num2str(pos)];
disp(str1);