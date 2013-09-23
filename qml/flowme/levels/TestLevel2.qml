import QtQuick 2.0
import ".."
import "../entities"
LevelBase {
    frictionFactor: 0.1;
    frictionTreshold: 0.1;
    originalHeight: 800;
    originalWidth: 1280;
    FlowSource {
        relY: 0.246875;
        relX: 0.121875;
        draggable: false;
        emitRate: 24;
        magnitude: 1.6000000000000003;
        flowTargetY: level.width * 0.0000177001953125;
        flowTargetX: level.width * 0.000625;
    }
    FlowTarget {
        draggable: false;
        relY: 0.2875;
        relX: 0.74921875;
        strength: level.width * level.width * 0.00007450580634176732;
    }
    FlowAttractor {
        draggable: false;
        relY: 0.359375;
        relX: 0.38046875;
        strength: 2;
    }
    FlowAttractor {
        draggable: false;
        relY: 0.3609375;
        relX: 0.51015625;
        strength: -2;
    }
    FlowAttractor {
        draggable: false;
        relY: 0.2296875;
        relX: 0.6304687499999999;
        strength: -2;
    }
    FlowAttractor {
        draggable: true;
        relY: 0.07656249999999999;
        relX: 0.59453125;
        strength: 2;
    }
    FlowAttractor {
        draggable: true;
        relY: 0.01171875;
        relX: 0.665625;
        strength: 2;
    }
    FlowAttractor {
        draggable: true;
        relY: 0.06484375;
        relX: 0.89765625;
        strength: 2;
    }
    FlowAttractor {
        draggable: true;
        relY: 0.01796875;
        relX: 0.73828125;
        strength: 2;
    }
    FlowAttractor {
        draggable: true;
        relY: 0.04921875;
        relX: 0.828125;
        strength: -2;
    }
    FlowAttractor {
        draggable: true;
        relY: 0.06484375;
        relX: 0.6828125;
        strength: -2;
    }
    FlowAttractor {
        draggable: true;
        relY: 0.103125;
        relX: 0.8453125;
        strength: -2;
    }
    FlowAttractor {
        draggable: true;
        relY: 0.0828125;
        relX: 0.771875;
        strength: -2;
    }
    FlowAttractor {
        draggable: false;
        relY: 0.22578125;
        relX: 0.38359375;
        strength: -2;
    }
    FlowAttractor {
        draggable: false;
        relY: 0.3546875;
        relX: 0.63203125;
        strength: 2;
    }
    FlowAttractor {
        draggable: false;
        relY: 0.2265625;
        relX: 0.51171875;
        strength: 2;
    }
}
