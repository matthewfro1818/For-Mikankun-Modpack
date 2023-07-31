function mysplit (inputstr, sep)
    if sep == nil then
        sep = "%s";
    end
    local t={};
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str);
    end
    return t;
end

-- Event notes hooks
function onEvent(name, value1, value2)
    if name == "MoveArrow" then
        local tableee=mysplit(value2,", "); -- Splits value1 into a table
        value1 = tonumber(value1);
        tableee[1] = tonumber(tableee[1]);
        tableee[2] = tonumber(tableee[2]);
        tableee[3] = tonumber(tableee[3]);
        tableee[4] = tonumber(tableee[4]);
        tableee[5] = tonumber(tableee[5]);

        if value1 < 4 then
            notePosX = getPropertyFromGroup('opponentStrums', value1, 'x');
            notePosY = getPropertyFromGroup('opponentStrums', value1, 'y');
        else
            notee = value1 - 4;
            notePosX = getPropertyFromGroup('playerStrums', notee, 'x');
            notePosY = getPropertyFromGroup('playerStrums', notee, 'y');
        end

        newnotePosX = notePosX + tableee[1];
        newnotePosY = notePosY + tableee[2];

        duration = tableee[5];
        rotation = tableee[3];
        opacity = tableee[4];


        if value1 == 0 then
            noteTweenX("x1",0,newnotePosX,duration,"quartInOut");
            noteTweenY("y1",0,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r1",0,rotation,duration, "quartInOut");
            noteTweenAlpha("o1",0,opacity,duration,"quartInOut");
        elseif value1 == 1 then
            noteTweenX("x2",1,newnotePosX,duration,"quartInOut");
            noteTweenY("y2",1,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r2",1,rotation,duration, "quartInOut");
            noteTweenAlpha("o2",1,opacity,duration,"quartInOut");
        elseif value1 == 2 then
            noteTweenX("x3",2,newnotePosX,duration,"quartInOut");
            noteTweenY("y3",2,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r3",2,rotation,duration, "quartInOut");
            noteTweenAlpha("o3",2,opacity,duration,"quartInOut");
        elseif value1 == 3 then
            noteTweenX("x4",3,newnotePosX,duration,"quartInOut");
            noteTweenY("y4",3,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r4",3,rotation,duration, "quartInOut");
            noteTweenAlpha("o4",3,opacity,duration,"quartInOut");
        elseif value1 == 4 then
            noteTweenX("x5",4,newnotePosX,duration,"quartInOut");
            noteTweenY("y5",4,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r5",4,rotation,duration, "quartInOut");
            noteTweenAlpha("o5",4,opacity,duration,"quartInOut");
        elseif value1 == 5 then
            noteTweenX("x6",5,newnotePosX,duration,"quartInOut");
            noteTweenY("y6",5,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r6",5,rotation,duration, "quartInOut");
            noteTweenAlpha("o6",5,opacity,duration,"quartInOut");
        elseif value1 == 6 then
            noteTweenX("x7",6,newnotePosX,duration,"quartInOut");
            noteTweenY("y7",6,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r7",6,rotation,duration, "quartInOut");
            noteTweenAlpha("o7",6,opacity,duration,"quartInOut");
        elseif value1 == 7 then
            noteTweenX("x8",7,newnotePosX,duration,"quartInOut");
            noteTweenY("y8",7,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r8",7,rotation,duration, "quartInOut");
            noteTweenAlpha("o8",7,opacity,duration,"quartInOut");
        if value1 == 8 then
            noteTweenX("x9",8,newnotePosX,duration,"quartInOut");
            noteTweenY("y9",8,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r9",8,rotation,duration, "quartInOut");
            noteTweenAlpha("o9",8,opacity,duration,"quartInOut");
        elseif value1 == 9 then
            noteTweenX("x10",9,newnotePosX,duration,"quartInOut");
            noteTweenY("y10",9,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r10",9,rotation,duration, "quartInOut");
            noteTweenAlpha("o10",9,opacity,duration,"quartInOut");
        elseif value1 == 10 then
            noteTweenX("x11",10,newnotePosX,duration,"quartInOut");
            noteTweenY("y11",10,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r11",10,rotation,duration, "quartInOut");
            noteTweenAlpha("o11",10,opacity,duration,"quartInOut");
        elseif value1 == 11 then
            noteTweenX("x12",11,newnotePosX,duration,"quartInOut");
            noteTweenY("y12",11,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r11",11,rotation,duration, "quartInOut");
            noteTweenAlpha("o11",11,opacity,duration,"quartInOut");
        elseif value1 == 12 then
            noteTweenX("x13",12,newnotePosX,duration,"quartInOut");
            noteTweenY("y13",12,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r13",12,rotation,duration, "quartInOut");
            noteTweenAlpha("o13",12,opacity,duration,"quartInOut");
        elseif value1 == 13 then
            noteTweenX("x14",13,newnotePosX,duration,"quartInOut");
            noteTweenY("y14",13,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r14",13,rotation,duration, "quartInOut");
            noteTweenAlpha("o14",13,opacity,duration,"quartInOut");
        elseif value1 == 14 then
            noteTweenX("x15",14,newnotePosX,duration,"quartInOut");
            noteTweenY("y15",14,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r15",14,rotation,duration, "quartInOut");
            noteTweenAlpha("o15",14,opacity,duration,"quartInOut");
        elseif value1 == 15 then
            noteTweenX("x16",15,newnotePosX,duration,"quartInOut");
            noteTweenY("y16",15,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r16",15,rotation,duration, "quartInOut");
            noteTweenAlpha("o16",15,opacity,duration,"quartInOut");
        elseif value1 == 16 then
            noteTweenX("x17",16,newnotePosX,duration,"quartInOut");
            noteTweenY("y17",16,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r17",16,rotation,duration, "quartInOut");
            noteTweenAlpha("o17",16,opacity,duration,"quartInOut");
        elseif value1 == 17 then
            noteTweenX("x18",17,newnotePosX,duration,"quartInOut");
            noteTweenY("y18",17,newnotePosY,duration,"quartInOut");
            noteTweenAngle("r18",17,rotation,duration, "quartInOut");
            noteTweenAlpha("o18",17,opacity,duration,"quartInOut");
        end
    end
end