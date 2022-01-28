function SP3=read_SP3(file)
% This function reads precise ephemerids file and extracts coordinates of
% satellites (in Meter in ECEF fram) and satellite clock error (in seconds)
%
% INPUT:        precise ephemerids file
% OUTPUT:       SP3 struct
%
% Amir Allahvirdi-Zadeh
% Email: amir.allahvirdizadeh@curtin.edu.au
% Created: Nov 2012
% Modified: Feb 2019
%##########################################################################
format long g
fid = fopen(file);
F = fread(fid);
EndL=[1;find(1-((10-F)&F))];
S = char(F');
RinT=char(32*ones(length(EndL),82));

for iE=1:length(EndL) -1
    RinT(iE,1:EndL(iE+1 )-EndL(iE)-1)=S(EndL(iE )+1:EndL(iE+1)-1);
end
fclose(fid);
fclose('all');
line_id=1;

k=1;
j=1;
w=1;
ww=1;
%File information
Number_of_Epochs=RinT(1,31:39);
Data_Used=RinT(1,40:44);
Coordinate_System=RinT(1,46:50);
Orbit_Type=RinT(1,52:55);
Agency=RinT(1,56:60);

SP3.info.Number_of_Epochs=str2num(Number_of_Epochs);
SP3.info.Data_Used=Data_Used;
SP3.info.Coordinate_System=Coordinate_System;
SP3.info.Orbit_Type=Orbit_Type;
SP3.info.Agency=Agency;

GPS_WEEK=RinT(2,4:7);
Second_of_week=RinT(2,9:23);
Time_Interval=RinT(2,27:38);
MJD=RinT(2,39:44);
Frac_day=RinT(2,45:60);

SP3.info.GPS_WEEK=str2num(GPS_WEEK);
SP3.info.Second_of_week=str2num(Second_of_week);
SP3.info.Time_Interval=str2num(Time_Interval);
SP3.info.MJD=str2num(MJD);
SP3.info.Frac_day=str2num(Frac_day);

while line_id<length(RinT)
    if RinT(line_id,1:3)=='EOF'
        break
    end
    
    line_id=line_id+1;
    
    if isequal(RinT(line_id,1:2),'%f')
        Base__Pos(w,1)=str2num(RinT(line_id,4:13));
        Base__Clk(w,1)=str2num(RinT(line_id,15:26));
        w=w+1;
    end
    
    if isequal(RinT(line_id,1:2),'%c')
        Time_System{ww,1}=RinT(line_id,10:12);
        ww=ww+1;
    end
    
    if isequal(RinT(line_id,1),'*')
        epoch=RinT(line_id,:);
        if epoch(1)=='E' && epoch(2)=='O' && epoch(3)=='F'
            break
        end
        epoch=char(epoch(1,2:82));
        epoch=str2num(epoch);
        
        SP3.data(j).Epoch=epoch;
        line_id=line_id+1 ;
        
        while contains(RinT(line_id,:),'P')
            sat=RinT(line_id,:);
            prn{k,1}=sat(2:4);
            
            
            x=str2num(sat(5:18));
            if isempty(x)
                x=NaN;
            end
            
            y=str2num(sat(19:32));
            if isempty(y)
                y=NaN;
            end
            
            z=str2num(sat(33:46));
            if isempty(z)
                z=NaN;
            end
            
            c=str2num(sat(47:60));
            if isempty(c)
                c=NaN;
            end
            
            position(k,1)=1e3*x;
            position(k,2)=1e3*y;
            position(k,3)=1e3*z;
            
            clock(k,1)=1e-6*c;
            
            line_id=line_id+1;
            k=k+1;
        end
        
        %Remove the unknon orbits and large clocks
        I=find(position(:,1)==0 | position(:,2)==0 | position(:,3)==0);
        position(I,1:3)=NaN;
        I=find(clock(:,1)>=0.9999);
        clock(I,1)=NaN;
        
        SP3.data(j).PRN=prn;
        
        SP3.data(j).Position=position;
        
        SP3.data(j).Clock=clock;
        clear position clock
        k=1;
        j=j+1;
        line_id=line_id-1;
    end
    
end
end