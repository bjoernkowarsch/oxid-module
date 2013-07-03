<?php
/**
 * {@inheritdoc}
 *
 * Additionally adds RatePAY specific informations.
 *
 * @extends oxOrder
 */

class rp_oxorder extends rp_oxorder_parent {

    function save() {

        $rp_paymenttype = (in_array($this->oxorder__oxpaymenttype->rawValue, pi_ratepay_util_utilities::$_RATEPAY_PAYMENT_METHOD)) ? true :false;

        $deliverydate = is_null($this->oxorder__oxsenddate->rawValue) ? false : true;

        if($deliverydate && $rp_paymenttype) {
            $delivery = new pi_ratepay_Details();
            $delivery->deliver();
        }

        parent::save();

    }

}