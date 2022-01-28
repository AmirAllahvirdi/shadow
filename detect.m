function [SAT_AT_SHADOW]=detect(Xct_sun,sp3)
%% PURPOSE: FINDING THE SATELLITES AT SHADOW OF THE EARTH
% INPUT:
%         Xct_sun:          SUN POSITION AT ECEF
%         sp3    :        SATELLITE COORDINATES AT ECEF
% OUTPUT:
%         SAT_AT_SHADOW:    THE SATELLITES AT SHADOW OF THE EARTH
%
% Amir Allahverdi Zadeh(Email: amir.allahvirdizadeh@curtin.edu.au)
% NOV 2011
%%
for ii=1:size(sp3.data,2)
    SAT_POS_ECEF.X=sp3.data(ii).Position(:,1);
    SAT_POS_ECEF.Y=sp3.data(ii).Position(:,2);
    SAT_POS_ECEF.Z=sp3.data(ii).Position(:,3);
    SAT_POS_ECEF.Epoch=sp3.data(ii).Epoch;
    SAT_POS=[SAT_POS_ECEF.X,SAT_POS_ECEF.Y,SAT_POS_ECEF.Z];
    
    uni_vec_sun=[Xct_sun.X(ii),Xct_sun.Y(ii),Xct_sun.Z(ii)];
    
    D=(SAT_POS(:,1).*uni_vec_sun(:,1)+SAT_POS(:,2).*uni_vec_sun(:,2)+SAT_POS(:,3).*uni_vec_sun(:,3));
    
    S_c(:,1)=SAT_POS(:,1)-(D.*uni_vec_sun(:,1));
    S_c(:,2)=SAT_POS(:,2)-(D.*uni_vec_sun(:,2));
    S_c(:,3)=SAT_POS(:,3)-(D.*uni_vec_sun(:,3));
    
    S_C=sqrt((S_c(:,1).^2)+(S_c(:,2).^2)+(S_c(:,3).^2));
    j=1;
    a_p=6370000;
    satellite=sp3.data(ii).PRN;
    SAT_AT_SHADOW(ii).Epoch=SAT_POS_ECEF.Epoch;
    for i=1:length(S_C)
        if D(i,1)<0
            if S_C(i,1)<a_p
                SAT_AT_SHADOW(ii).PRN{j,1}=satellite{i,1};
                j=j+1;
            end
        end
    end
end