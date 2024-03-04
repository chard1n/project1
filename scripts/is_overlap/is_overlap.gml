function is_overlap(x1, y1, x2, y2, x3, y3, x4, y4) {
	
	 minX1 = min(x1, x2);
     minY1 = min(y1, y2);
     maxX1 = max(x1, x2);
     maxY1 = max(y1, y2);

     minX2 = min(x3, x4);
     minY2 = min(y3, y4);
     maxX2 = max(x3, x4);
     maxY2 = max(y3, y4);

    // If one rectangle is on the left side of the other
    if (maxX1 < minX2 || maxX2 < minX1) {
        return false;
    }

    // If one rectangle is above the other
    if (maxY1 < minY2 || maxY2 < minY1) {
        return false;
    }

    // If rectangles share a side or one is entirely inside the other
    if (x1 == x2 || y1 == y2 || x3 == x4 || y3 == y4) {
        return false;
    }

    return true;
	
}