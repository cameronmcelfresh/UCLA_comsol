

I=[1,0,0;0,1,0;0,0,1]; %identity matrix

E11 = ones(1,length(Sigma11));

for i=1:length(F11)
    
    F = [F11(i),F12(i), F13(i);
        F21(i),F22(i), F23(i);
        F31(i),F32(i), F33(i)];
    
    Ft = F';
    
    E = (Ft*F-I)/2;
    
    E11(i) = E(1,1);
    
end

plot(E11,Sigma11);

ylabel("\sigma_{11} - Intermediate Stress [Pa]")
xlabel("E_{11} - 1^{st} Axial Strain Component")

ylim([0 max(Sigma11)*1.1])