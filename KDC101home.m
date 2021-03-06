function KDC101home(KDC101,timeout_val)
KDC101.Home(timeout_val);
fprintf('Motor homed.\n');
pos = System.Decimal.ToDouble(KDC101.Position);
%fprintf('The motor position is %d.\n',pos);
str1 = ['Motor @ ',num2str(pos)];
disp(str1);
end