from googleapiclient import discovery

from oauth2client.client import GoogleCredentials

import requests


def delete_vm():

    credentials = GoogleCredentials.get_application_default()

    service = discovery.build('compute', 'v1', credentials=credentials)

    project_id = requests.get(
        "http://metadata.google.internal/computeMetadata/v1/project/project-id",
        headers={"Metadata-Flavor": "Google"}
    ).text

    name = requests.get(
        "http://metadata.google.internal/computeMetadata/v1/instance/name",
        headers={"Metadata-Flavor": "Google"}
    ).text

    zone_long = requests.get(
        "http://metadata.google.internal/computeMetadata/v1/instance/zone",
        headers={"Metadata-Flavor": "Google"}
    ).text
    zone = zone_long.split("/")[-1]

    print(f'[delete target] project_id:{project_id},name:{name},zone:{zone}')
    request = service.instances().delete(
        project=project_id,
        zone=zone,
        instance=name
    )
    request.execute()