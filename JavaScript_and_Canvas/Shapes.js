// Snapes

function getSnape(ctx, xStep, yStep, index){
    switch(index){

    case(0):
        ctx.beginPath();
        ctx.moveTo(2 * xStep, yStep);
        ctx.lineTo(3 * xStep, 2 * yStep);
        ctx.lineTo(4 * xStep, yStep);
        ctx.lineTo(5 * xStep, 2 * yStep);
        ctx.lineTo(3 * xStep, 4 * yStep);
        ctx.lineTo(xStep, 2 * yStep);
        ctx.lineTo(2 * xStep, yStep);
        ctx.closePath();
        break;

    case(1):
        ctx.beginPath();
        ctx.moveTo(3 * xStep, yStep);
        ctx.lineTo(3.5 * xStep, 2 * yStep);
        ctx.lineTo(5 * xStep, 2.5 * yStep);
        ctx.lineTo(4 * xStep, 3 * yStep);
        ctx.lineTo(4 * xStep, 4 * yStep);
        ctx.lineTo(3 * xStep, 3.5 * yStep);
        ctx.lineTo(2 * xStep, 4 * yStep);
        ctx.lineTo(2 * xStep, 3 * yStep);
        ctx.lineTo(1 * xStep, 2.5 * yStep);
        ctx.lineTo(2.5 * xStep, 2 * yStep);
        ctx.closePath();
        break;

    case(2):
        ctx.beginPath();
        ctx.arc(3 * xStep, 2.5 * yStep, (xStep * 6) / 3 , 0, 2 * Math.PI, false);
        ctx.closePath();
        break;

    case(3):
        ctx.beginPath();
        ctx.moveTo(3 * xStep, yStep);
        ctx.lineTo(5 * xStep, 2 * yStep);
        ctx.lineTo(5 * xStep, 4 * yStep);
        ctx.lineTo(1 * xStep, 4 * yStep);
        ctx.lineTo(1 * xStep, 2 * yStep);
        ctx.closePath();
        break;

    case(4):
        ctx.beginPath();
        ctx.moveTo(2 * xStep, 0.5 * yStep);
        ctx.lineTo(4 * xStep, 0.5 * yStep);
        ctx.lineTo(4 * xStep, 1.5 * yStep);
        ctx.lineTo(3 * xStep, 2.5 * yStep);
        ctx.lineTo(4 * xStep, 3.5 * yStep);
        ctx.lineTo(4 * xStep, 4.5 * yStep);
        ctx.lineTo(2 * xStep, 4.5 * yStep);
        ctx.lineTo(2 * xStep, 3.5 * yStep);
        ctx.lineTo(3 * xStep, 2.5 * yStep);
        ctx.lineTo(2 * xStep, 1.5 * yStep);
        ctx.closePath();
        break;
    }
}
