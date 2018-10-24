height = 80;
cordLength = 30;    %unweightedLength
%Yang dicari spring constant
k = 0;
i = 1;
kVec(101) = 0;
for mass = 50:150
  oof = true;
  while(oof)
    length = 0;
    gravity = -9.81;
    restoreForce = 0;
    %simulate jatuh
    dV = 0;
    RF = 0;
    dT = 0.01;
    length = 0;
    weight = mass*gravity;
    vel = 0;
    dL = 0;
    F = 0;
    oof = false;
    while((length < height) && (vel <= 0))
      if(length > cordLength)
        RF = k*(length - cordLength);
      else
        RF = 0;
      end
      F = RF + weight;
      a = F/mass;
      dV = a*dT;
      vel = vel + dV;
      dL = -vel*dT;
      length = length + dL;
      %fprintf('L = %.3f\n',length);
    end
    if(length >= height)
      oof = true;
    end
    k = k+1;
  end
  kVec(i) = k;
  i = i+1;
end
plot(50:150, kVec);
