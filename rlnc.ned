//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

simple Node
{
    gates:
        input uplink[];
        output downlink[];
}

network Butterfly
{
    submodules:

        nodeA: Node {
            @display("p=316,64");
            gates:
                downlink[2];
        }

        nodeB: Node {
            @display("p=158,154");
            gates:
                uplink[1];
                downlink[2];
        }

        nodeC: Node {
            @display("p=441,154");
            gates:
                uplink[1];
                downlink[2];
        }

        nodeD: Node {
            @display("p=305,268");
            gates:
                uplink[2];
                downlink[1];
        }

        nodeE: Node {
            @display("p=305,364");
            gates:
                uplink[1];
                downlink[2];
        }

        nodeF: Node {
            @display("p=158,473");
            gates:
                uplink[2];
        }

        nodeG: Node {
            @display("p=441,473");
            gates:
                uplink[2];
        }

    connections:
        // A -> B
        nodeA.downlink[0] --> {  delay = 100ms; } --> nodeB.uplink[0];
        
        // A -> C
        nodeA.downlink[1] --> {  delay = 100ms; } --> nodeC.uplink[0];

        // B -> D
        nodeB.downlink[0] --> {  delay = 100ms; } --> nodeD.uplink[0];

        // B -> F
        nodeB.downlink[1] --> {  delay = 100ms; } --> nodeF.uplink[0];

        // C -> D
        nodeC.downlink[0] --> {  delay = 100ms; } --> nodeD.uplink[1];

        // C -> G
        nodeC.downlink[1] --> {  delay = 100ms; } --> nodeG.uplink[0];

        // D -> E
        nodeD.downlink[0] --> {  delay = 100ms; } --> nodeE.uplink[0];

        // E -> F
        nodeE.downlink[0] --> {  delay = 100ms; } --> nodeF.uplink[1];

        // E -> G
        nodeE.downlink[1] --> {  delay = 100ms; } --> nodeG.uplink[1];

}
