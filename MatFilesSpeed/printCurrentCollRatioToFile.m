function printCurrentCollRatioToFile (time,IDvehicle, positionManagement,outParams)

if ~isempty(IDvehicle)

    filename = sprintf('%s/Curr_ColRatio_%d.xls',outParams.outputFolder,outParams.simID);

    fid = fopen(filename,'a');
    
    fprintf(fid,'%f',time);

    % FisDisToPrint = zeros(1,maxID);
    CurColRatioToPrint = positionManagement.currentColli;

    fprintf(fid,'\t%.2f',CurColRatioToPrint);


    fprintf(fid,'\n');
    fclose(fid);

end

end