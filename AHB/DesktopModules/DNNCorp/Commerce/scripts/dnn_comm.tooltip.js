if (typeof (dnn_comm) == 'undefined') {
    dnn_comm = {};
};
dnn_comm.tooltip = {
    amuiid: 'amuitt-',
    top: 0,
    left: 0,
    timer: 20,
    animation: true,
    amuitt: null,
    c: null,
    id: null,
    show: function (v, y, x, obj, cls) {
        this.top = y;
        this.left = x;
        var isHidden = false;
        dnn_comm.tooltip.cancel();
        if (this.amuitt == null) {
            var id = this.amuiid + obj.id;
            this.amuitt = document.createElement('div');
            this.amuitt.setAttribute('id', id);
            this.amuitt.setAttribute('class', 'dnnCart-form-tooltip dnnCart-tooltip dnnCart-tooltip-content ' + cls);
            this.amuitt.style.display = 'none';
            this.c = document.createElement('div');
            this.c.setAttribute('id', 'aspb-content-' + id);
            this.c.className = 'dnnCart-tooltip-text';
            var divtip = document.createElement('div');
            divtip.setAttribute('class', 'dnnCart-tooltip-pointer-top dnnCart-tooltip-content');
            var divtipinner = document.createElement('div');
            divtipinner.setAttribute('class', 'dnnCart-tooltip-pointer-top-inner ' + cls);
            divtip.appendChild(divtipinner);
            this.amuitt.appendChild(divtip);
            this.amuitt.appendChild(this.c);
            document.body.appendChild(this.amuitt);
            this.amuitt.style.display = 'block';
            isHidden = true;
        };

        if (this.id != this.amuiid + obj.id) {
            this.id = this.amuiid + obj.id;
            this.amuitt.setAttribute('id', this.id);
            this.amuitt.style.display = 'block';
            this.c.innerHTML = v;
            this.amuitt.style.left = this.left + 'px'; // (this.amuitt.offsetWidth / 2)) + 'px';
            this.amuitt.style.top = this.top + 'px'; // this.amuitt.offsetHeight/2) + 'px';
        };
        //$('#' + this.amuitt.id).fadeIn();


    },
    hide: function () {
        clearTimeout(dnn_comm.tooltip.timer);
        var tid = dnn_comm.tooltip.id;
        dnn_comm.tooltip.timer = setTimeout(function () {
            //$('#' + tid).fadeOut();
        }, 600);

    },
    cancel: function () {
        clearTimeout(dnn_comm.tooltip.timer);
    }

};