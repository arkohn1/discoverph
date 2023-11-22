<style>
    #uni_modal .modal-dialog {
        margin: 30px auto;
    }

    #uni_modal .modal-content {
        background-color: white;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
    }

    #uni_modal .modal-content .modal-body {
        color: white; /* Set the text color inside the modal body to white */
    }

    #uni_modal .modal-content > .modal-footer {
        display: none;
    }

    /* Override Bootstrap modal backdrop */
    .modal-backdrop {
        background-color: rgba(0, 0, 0, 0.5) !important; /* Set background color to a darkened color with some transparency */
    }
</style>

<div class="container-fluid">
    <?php include 'privacy_policy.html' ?>
</div>

<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>
