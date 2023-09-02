import * as core from "@actions/core";
import * as exec from "@actions/exec";

async function run() {
    try {
        const template = core.getInput("template");
        const ignore = core.getInput("ignore");

        await exec.exec(`IGNORE=${ignore} TEMPLATE=${template} make all purge-deploy`);
    } catch (error) {
        core.setFailed(error.message);
    }
}

run();
