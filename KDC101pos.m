function KDC101pos(KDC101)
pos = System.Decimal.ToDouble(KDC101.Position);
str1 = ['Motor @ ',num2str(pos)];
disp(str1);
end