<template>
    <div class="container">
        <!-- Trigger the modal with a button -->
        <button id="btn-modal" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="display: none;">Open Modal</button>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content" style="height: 400px; width:600px">
                    <div class="modal-header">
                        <h4 style="text-align: center" class="modal-title">Media Browser</h4>
                    </div>
                    <div class="modal-body">
                        <p >
                            <img id="modal-media" style="width:565px; height:210px; max-width:565px; max-height:210px;" />
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btn-next" type="button" class="btn btn-default">Next</button>
                        <button id="btn-prev" type="button" class="btn btn-default">Previous</button>


                    </div>
                </div>

            </div>
        </div>

    </div>
</template>