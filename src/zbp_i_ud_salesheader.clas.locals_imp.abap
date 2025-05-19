*CLASS lhc_zi_ud_item DEFINITION INHERITING FROM cl_abap_behavior_handler.
*
*  PRIVATE SECTION.
*
**    METHODS getCarrier FOR MODIFY
**      IMPORTING keys FOR ACTION Zi_UD_ITEM~getCarrier RESULT result.
*
*ENDCLASS.
*
*CLASS lhc_zi_ud_item IMPLEMENTATION.
*
**  METHOD getCarrier.
**  ENDMETHOD.
*
*ENDCLASS.

CLASS lhc_Zi_ud_SalesHeader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Zi_ud_SalesHeader RESULT result.

ENDCLASS.

CLASS lhc_Zi_ud_SalesHeader IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
