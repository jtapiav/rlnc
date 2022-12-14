#include <omnetpp.h>
#include <string.h>

using namespace omnetpp;

class Node : public cSimpleModule {
    protected:
    virtual void initialize() override;
    virtual void handleMessage( cMessage* msg ) override;
};

class Encoder : public Node {
    protected:
    virtual void handleMessage( cMessage* msg ) override;
};

class Decoder : public Node {
    protected:
    virtual void handleMessage( cMessage* msg ) override;
};

Define_Module( Node );
Define_Module( Encoder );
Define_Module( Decoder );

void Node::initialize() {
    EV << getName();
    if( strcmp( "nodeA", getName() ) == 0 ) {
        cMessage *msg = new cMessage( "tictocMsg" );
        cMessage *msgCopy = (cMessage*) msg->dup();

        send( msg, "downlink", 0 );
        send( msgCopy, "downlink", 1 );
    } 
}

void Node::handleMessage( cMessage *msg ) {
    cGate *arrivalGate = msg->getArrivalGate();
    int interfaceInput = arrivalGate->getIndex();

    for( int i = 0; i < gateSize( "downlink" ); i++ ) {
        EV << "Forwarding message " << msg << "on port out["<< i <<"]\n";
        cMessage* msgCopy = (cMessage*) msg->dup();
        send( msgCopy, "downlink", i );
    }
}   

void Encoder::handleMessage( cMessage *msg ) {

}

void Decoder::handleMessage( cMessage* msg ) {

}